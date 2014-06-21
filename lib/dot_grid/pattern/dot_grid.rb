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
        pdf.fill_color grid_color
        (0..rows).each do |row|
          (0..columns).each do |col|
            pdf.fill_circle [col*spacing, row*spacing], dot_weight
          end
        end
      end
    end
  end
end
