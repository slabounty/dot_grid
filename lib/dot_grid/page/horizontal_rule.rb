module DotGrid
  module Page
    class HorizontalRule < Page
      attr_accessor(
        :pattern
      )

      def initialize(params)
        super
        @pattern = ::DotGrid::Pattern::HorizontalRule.new(params.merge!(:bounds => pdf.bounds))
      end

      def generate
        super
        pattern.draw
      end
    end
  end
end

