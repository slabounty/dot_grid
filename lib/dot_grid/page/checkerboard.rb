module DotGrid
  module Page
    class Checkerboard < Page
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
        pdf.fill_color grid_color
        (0..num_rows).each do |row|
          (0..num_columns).each do |column|
            if (row % 2 == 0 && column % 2 == 0) || (row % 2 == 1 && column % 2 == 1)
              pdf.fill_rectangle [column*spacing, row*spacing], spacing, spacing
            end
          end
        end
      end
    end
  end
end

