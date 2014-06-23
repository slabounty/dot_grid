module DotGrid
  module Page
    class Grid < Page

      def post_initialize(params)
        add_pattern(::DotGrid::Pattern::Grid.new(params.merge!(:bounds => pdf.bounds)))
      end
    end
  end
end
