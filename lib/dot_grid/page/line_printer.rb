module DotGrid
  module Page
    class LinePrinter < Page

      def post_initialize(params)
        add_pattern(::DotGrid::Pattern::LinePrinter.new(params))
      end
    end
  end
end
