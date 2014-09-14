module DotGrid
  module Page
    class DotDash < Page

      def post_initialize(params)
        add_pattern(::DotGrid::Pattern::DotDash.new(params))
      end
    end
  end
end

