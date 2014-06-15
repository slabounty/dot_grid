module DotGrid
  module Page
    class DotGrid < Page
      attr_accessor(
        :dot_weight,
        :grid_color,
        :spacing,
        :pattern
      )

      def initialize(params)
        super
        @pattern = ::DotGrid::Pattern::DotGrid.new(params.merge!(:bounds => pdf.bounds))
      end

      def generate
        super
        pattern.draw
      end
    end
  end
end
