module DotGrid
  module Page
    class Planner < Page
      attr_accessor(
        :planner_color_1,
        :planner_color_2,
        :dot_weight,
        :grid_color,
        :spacing,
      )

      HEADER_HEIGHT = 0.05               # 5.0 %
      HEADER_LEFT_START = 0.05           # 5.0%
      SQUARE_GRID_WIDTH = 0.30           # 30.0%
      HEADER_GAP_WIDTH = 0.03            # 3.0%
      DOT_GRID_COLUMN_WIDTH = 0.62       # 62%
      SQUARE_GRID_ROWS_WIDTH = 0.80      # 80%
      FOOT_HEIGHT_RATIO = 2              # Ratio of footer to header

      def post_initialize(params)
        @planner_color_1 = params[:planner_color_1] || "CCCCCC"
        @planner_color_2 = params[:planner_color_2] || "0099ff"
        @dot_weight = params[:dot_weight] || 1.5
        @grid_color = params[:grid_color] || "B3B3B3"
        @spacing = params[:spacing] ? params[:spacing].mm : 5.mm
        add_pattern(::DotGrid::Pattern::SquareGrid.new(params.merge!(:bounds => square_grid_bounds)))
        add_pattern(::DotGrid::Pattern::DotGrid.new(params.merge!(:bounds => dot_grid_bounds)))
      end

      def square_grid_bounds
        ::DotGrid::BoundingBox.new(upper_left: [header_left_start, grid_top], width: header_left_width, height: grid_height)
      end

      def dot_grid_bounds
        ::DotGrid::BoundingBox.new(upper_left: [header_right_start, grid_top], width: header_right_width, height: grid_height)
      end

      def header_height
        HEADER_HEIGHT * page_height
      end

      def grid_top
        page_height - header_height - spacing
      end

      def grid_height
        (grid_top - footer_height - spacing)
      end

      def header_left_color
        planner_color_1
      end

      def header_left_start
        HEADER_LEFT_START * page_width
      end

      def header_left_width
        ((SQUARE_GRID_WIDTH * page_width) / spacing).floor * spacing
      end

      def header_gap_start
        header_left_start + header_left_width
      end

      def header_gap_width
        page_width * HEADER_GAP_WIDTH
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

      def footer_height
        header_height * FOOT_HEIGHT_RATIO
      end

      def generate
        super

        # Header left
        draw_header(header_left_start, header_left_width, header_height, header_left_color)

        # Header right
        draw_header(header_right_start, header_right_width, header_height, header_right_color)

        # Footer
        draw_footer(planner_color_1, header_left_start, footer_height, page_width-header_left_start)
      end

      def draw_header(header_start, header_width, header_height, header_color)
        pdf.fill_color header_color
        pdf.fill_rectangle [header_start, page_height], header_width, header_height
      end

      def draw_footer(footer_color, footer_start, footer_height, footer_width)
        pdf.fill_color footer_color
        pdf.fill_rectangle [footer_start, footer_height], footer_width, footer_height
      end

      def page_width
        pdf.bounds.width
      end

      def page_height
        pdf.bounds.height
      end
    end
  end
end
