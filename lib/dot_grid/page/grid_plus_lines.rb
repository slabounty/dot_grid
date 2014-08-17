module DotGrid
  module Page
    class GridPlusLines < Page

      def post_initialize(params)
        add_pattern(::DotGrid::Pattern::GridPlusLines.new(params))
      end
    end
  end
end

