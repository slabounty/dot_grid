module DotGrid
  module Page
    class DotGrid < Page

      def post_initialize(params)
        add_pattern(::DotGrid::Pattern::DotGrid.new(params.merge!(:bounds => pdf.bounds)))
      end
    end
  end
end
