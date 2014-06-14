module DotGrid
  module Page
    class Grid < Page
      attr_accessor(
        :grid_color,
        :spacing,
      )

      def initialize(params)
        super
      end

      def page_rows
        (page_height / spacing).floor
      end

      def page_columns
        (page_width / spacing).floor
      end

      def generate
        super
        num_columns = page_columns
        num_rows = page_rows
        pdf.stroke_color grid_color
        (0..num_rows).each do |row|
          pdf.stroke_horizontal_line(0, page_width, :at => row*spacing)
        end
        (0..num_columns).each do |column|
          pdf.stroke_vertical_line(0, page_height, :at => column*spacing)
        end
      end
    end
  end
end
