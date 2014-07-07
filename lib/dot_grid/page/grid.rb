module DotGrid
  module Page
    class Grid < Page

      def post_initialize(params)
        add_pattern(::DotGrid::Pattern::Grid.new(params))
      end
    end
  end
end
