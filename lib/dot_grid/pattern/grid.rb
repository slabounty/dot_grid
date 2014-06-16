module DotGrid
  module Pattern
    class Grid
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
        pdf.stroke_color grid_color
        (0..rows).each do |row|
          pdf.stroke_horizontal_line(0, bounds.width, :at => row*spacing)
        end
        (0..columns).each do |column|
          pdf.stroke_vertical_line(0, bounds.height, :at => column*spacing)
        end
      end
    end
  end
end
