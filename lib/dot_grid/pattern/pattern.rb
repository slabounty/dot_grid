module DotGrid
  module Pattern
    class Pattern
      attr_accessor(
        :pdf,
        :bounds,
        :grid_color,
        :spacing,
      )

      def initialize(params = {})
        @pdf = params[:pdf]
        @bounds = params[:bounds] || ::DotGrid::BoundingBox.new(upper_left: [0, pdf.bounds.height], width: pdf.bounds.width, height: pdf.bounds.height)
        @grid_color = params[:grid_color] || "B3B3B3"
        @spacing = params[:spacing] ? params[:spacing].mm : 5.mm
        post_initialize(params)
      end

      def post_initialize(params)
        nil
      end

      def rows
        (bounds.height / spacing).floor
      end

      def columns
        (bounds.width / spacing).floor
      end

      def draw
        raise NotImplementedError
      end
    end
  end
end

