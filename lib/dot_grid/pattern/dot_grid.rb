module DotGrid
  module Pattern
    class DotGrid
      attr_accessor(
        :pdf,
        :dot_weight,
        :grid_color,
        :spacing,
        :bounds
      )

      def initialize(params = {})
        @pdf = params[:pdf]
        @bounds = params[:bounds]
        @dot_weight = params[:dot_weight] || 1.5
        @grid_color = params[:grid_color] || "B3B3B3"
        @spacing = params[:spacing] ? params[:spacing].mm : 5.mm
      end

      def rows
        (bounds.height / spacing).floor
      end

      def columns
        (bounds.width / spacing).floor
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
