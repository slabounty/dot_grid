module DotGrid
  module Pattern
    class Checkerboard < Pattern

      def draw_square?(row, column)
        (row % 2 == 0 && column % 2 == 0) || (row % 2 == 1 && column % 2 == 1)
      end

      def draw_row(row)
        (0..columns).each do |column|
          pdf.fill_rectangle [column*spacing, row*spacing], spacing, spacing if draw_square?(row, column)
        end
      end

      def draw
        pdf.fill_color grid_color
        pdf.bounding_box(bounds.upper_left, width: bounds.width, height: bounds.height) do
          (0..rows).each do |row|
            draw_row(row)
          end
        end
      end
    end
  end
end
