class DotGridPlanner < DotGridPage
  attr_accessor(
    :planner_color_1,
    :planner_color_2
  )

  def initialize(params)
    super
    @planner_color_1 = params[:planner_color_1]
    @planner_color_2 = params[:planner_color_2]
  end

  def generate
    pdf.start_new_page

    width = page_width
    height = page_height
    header_height = 0.05 * height

    square_grid_rows = 45
    square_grid_columns = 13

    header_left_color = planner_color_1
    header_left_start = width*0.05
    header_left_width = square_grid_columns*spacing

    header_gap_start = header_left_start + header_left_width
    header_gap_width = width*0.03

    header_right_color = planner_color_2
    header_right_start = header_gap_start + header_gap_width
    header_right_width = width - header_right_start

    # Header left
    pdf.fill_color header_left_color
    pdf.fill_rectangle [header_left_start, height], header_left_width, header_height

    # Header right
    pdf.fill_color header_right_color
    pdf.fill_rectangle [header_right_start, height], header_right_width, header_height

    # Square Grid Left
    draw_square_grid_left(square_grid_rows, square_grid_columns, header_left_color, header_left_start, height - header_height - spacing, spacing)

    # Dot Grid Right
    draw_dot_grid(46, 28, header_right_start, height-header_height)

    # Footer
    draw_footer(planner_color_1, header_left_start, header_height*2, width-header_left_start)
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
