module DotGrid
  module Page
    class Checkerboard < Page

      def post_initialize(params)
        add_pattern(::DotGrid::Pattern::Checkerboard.new(params))
      end
    end
  end
end

