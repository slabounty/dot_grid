module DotGrid
  module Page
    class Page
      attr_accessor(
        :pdf,
        :patterns
      )

      def initialize(params)
        @pdf = params[:pdf]
        @patterns = []
        post_initialize(params)
      end

      def post_initialize(params)
        nil
      end

      def add_pattern(pattern)
        patterns << pattern
      end

      def generate
        pdf.start_new_page
        patterns.each { |pattern| pattern.draw }
      end
    end
  end
end
