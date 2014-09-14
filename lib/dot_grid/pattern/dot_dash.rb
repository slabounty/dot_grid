module DotGrid
  module Pattern
    class DotDash < Pattern
      attr_accessor(
        :dot_weight,
      )

      POST_DOT_SPACING = 0.2
      TO_LENGTH = 1.0 - POST_DOT_SPACING

      def post_initialize(params)
        @dot_weight = params[:dot_weight] || 1.5
      end

      def draw
        pdf.line_width @dot_weight
        pdf.fill_color grid_color
        pdf.stroke_color grid_color
        draw_grid do |row, column|
          pdf.fill_circle [column*spacing, row*spacing], dot_weight
          pdf.stroke_horizontal_line(column*spacing+POST_DOT_SPACING*spacing, column*spacing+spacing*TO_LENGTH, :at => row*spacing) 
          pdf.stroke_vertical_line(row*spacing+POST_DOT_SPACING*spacing, row*spacing+spacing*TO_LENGTH, :at => column*spacing) 
        end
      end
    end
  end
end

