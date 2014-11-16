module DotGrid
  module Pattern
    class DotGrid < Pattern
      attr_accessor(
        :dot_weight,
      )

      def post_initialize(params)
        @dot_weight = params[:dot_weight] || 1.5
      end

      def draw
        pdf.fill_color grid_color.color_str
        draw_grid do |row, column|
          pdf.fill_circle [column*spacing, row*spacing], dot_weight
        end
      end
    end
  end
end
