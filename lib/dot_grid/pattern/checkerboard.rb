module DotGrid
  module Pattern
    class Checkerboard
      attr_accessor(
        :pdf,
        :bounds,
        :grid_color,
        :spacing,
      )

      def initialize(params = {})
        @pdf = params[:pdf]
        @bounds = params[:bounds]
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
          (0..columns).each do |column|
            if (row % 2 == 0 && column % 2 == 0) || (row % 2 == 1 && column % 2 == 1)
              pdf.fill_rectangle [column*spacing, row*spacing], spacing, spacing
            end
          end
        end
      end
    end
  end
end
