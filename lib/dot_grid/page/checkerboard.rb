module DotGrid
  module Page
    class Checkerboard < Page
      attr_accessor(
        :pattern,
      )

      def initialize(params)
        super
        @pattern = ::DotGrid::Pattern::Checkerboard.new(params.merge!(:bounds => pdf.bounds))
      end

      def generate
        super
        pattern.draw
      end
    end
  end
end

