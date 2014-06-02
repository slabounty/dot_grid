module DotGrid
  class Planner < Page
    attr_accessor(
      :planner_color_1,
      :planner_color_2
    )

    HEADER_HEIGHT_PERCENT = 5.00
    HEADER_LEFT_START_PERCENT = 5.00

    def initialize(params)
      super
      @planner_color_1 = params[:planner_color_1] || "CCCCCC"
      @planner_color_2 = params[:planner_color_2] || "0099ff"
    end

    def header_height
      (HEADER_HEIGHT_PERCENT / 100.0) * page_height
    end

    def square_grid_columns
      (page_width * 0.30 / spacing).floor
    end

    def header_left_color
      planner_color_1
    end

    def header_left_start
      (HEADER_LEFT_START_PERCENT / 100.0) * page_width
    end

    def header_left_width
      square_grid_columns*spacing
    end

    def header_gap_start
      header_left_start + header_left_width
    end

    def header_gap_width
      page_width*0.03
    end

    def dot_grid_columns
      (page_width * 0.62 / spacing).floor  + 2
    end

    def dot_grid_rows
      square_grid_rows + 1
    end

    def header_right_color
      planner_color_2
    end

    def header_right_start
      header_gap_start + header_gap_width
    end

    def header_right_width
      page_width - header_right_start
    end

    def square_grid_rows
      (page_height * 0.80 / spacing).floor
    end

    def footer_height
      header_height * 2
    end

    def generate
      pdf.start_new_page

      # Header left
      draw_header(header_left_start, header_left_width, header_height, header_left_color)

      # Header right
      draw_header(header_right_start, header_right_width, header_height, header_right_color)

      # Square Grid Left
      draw_square_grid_left(square_grid_rows, square_grid_columns, header_left_color, header_left_start, page_height - header_height - spacing, spacing)

      # Dot Grid Right
      draw_dot_grid(dot_grid_rows, dot_grid_columns, header_right_start, page_height-header_height)

      # Footer
      draw_footer(planner_color_1, header_left_start, footer_height, page_width-header_left_start)
    end

    def draw_header(header_start, header_width, header_height, header_color)
      pdf.fill_color header_color
      pdf.fill_rectangle [header_start, page_height], header_width, header_height
    end

    def draw_square_grid_left(square_grid_rows, square_grid_columns, grid_color, left_start, height_start, spacing)
      pdf.fill_color grid_color
      (1..square_grid_rows).each do |row|
        (1..square_grid_columns).each do |col|
          pdf.fill_rectangle [left_start + (col-1)*spacing, height_start - (row-1)*spacing], spacing-1 ,spacing-1
        end
      end
    end

    def draw_footer(footer_color, footer_start, footer_height, footer_width)
      pdf.fill_color footer_color
      pdf.fill_rectangle [footer_start, footer_height], footer_width, footer_height
    end
  end
end
