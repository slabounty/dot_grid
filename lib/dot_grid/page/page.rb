module DotGrid
  module Page
    class Page
      attr_accessor(
        :pdf,
        :dot_weight,
        :grid_color,
        :spacing
      )

      def initialize(params)
        @pdf = params[:pdf]
        @dot_weight = params[:dot_weight] || 1.5
        @grid_color = params[:grid_color] || "B3B3B3"
        @spacing = params[:spacing] ? params[:spacing].mm : 5.mm
        post_initialize(params)
      end

      def post_initialize(params)
        nil
      end

      def generate
        pdf.start_new_page
      end

      def page_width
        pdf.bounds.width
      end

      def page_height
        pdf.bounds.height
      end

      def draw_dot_grid(rows, columns, left_start, height_start)
        pdf.fill_color grid_color
        (1..rows).each do |row|
          (1..columns).each do |col|
            pdf.fill_circle [left_start + (col-1)*spacing, height_start - spacing - (row-1)*spacing], dot_weight
          end
        end
      end
    end
  end
end
