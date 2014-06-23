module DotGrid
  module Page
    class HorizontalRule < Page

      def post_initialize(params)
        add_pattern(::DotGrid::Pattern::HorizontalRule.new(params.merge!(:bounds => pdf.bounds)))
      end
    end
  end
end
