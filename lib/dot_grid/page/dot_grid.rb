module DotGrid
  module Page
    class DotGrid < Page

      def post_initialize(params)
        add_pattern(::DotGrid::Pattern::DotGrid.new(params))
      end
    end
  end
end
