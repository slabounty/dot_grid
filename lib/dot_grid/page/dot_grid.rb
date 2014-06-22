module DotGrid
  module Page
    class DotGrid < Page
      attr_accessor(
        :pattern
      )

      def post_initialize(params)
        @pattern = ::DotGrid::Pattern::DotGrid.new(params.merge!(:bounds => pdf.bounds))
      end

      def generate
        super
        pattern.draw
      end
    end
  end
end
