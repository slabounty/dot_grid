module DotGrid
  module Page
    class Grid < Page
      attr_accessor(
        :grid_color,
        :spacing,
        :pattern
      )

      def initialize(params)
        super
        @pattern = ::DotGrid::Pattern::Grid.new(params.merge!(:bounds => pdf.bounds))
      end

      def generate
        super
        pattern.draw
      end
    end
  end
end
