module DotGrid
  module Pattern
    class LinePrinter < Pattern
      attr_accessor(
        :grid_color,
        :dot_weight,
        :planner_color_1,
      )

      def post_initialize(params)
        @grid_color = params[:grid_color] || ::DotGrid::Color.new("DDDDDD")
        @dot_weight = params[:dot_weight] || 5.0
        @planner_color_1 = params[:planner_color_1] || ::DotGrid::Color.new("D7E7DD")
      end

      def draw
        draw_grid do |row, column|
          if column == 0
            draw_holes(row)

            if (row % 2) == 0
              pdf.fill_color planner_color_1.color_str
              pdf.fill_rectangle [2*spacing, row*spacing], (columns-4)*spacing, spacing-1
            end
          end
        end
      end

      def draw_holes(row)
        pdf.fill_color grid_color.color_str
        pdf.fill_circle [1*spacing, (row + 0.5)*spacing], dot_weight
        pdf.fill_circle [(columns-1)*spacing, (row + 0.5)*spacing], dot_weight
      end
    end
  end
end


