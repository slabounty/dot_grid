module DotGrid
  module Pattern
    class Checkerboard < Pattern

      def draw_square?(row, column)
        (row % 2 == 0 && column % 2 == 0) || (row % 2 == 1 && column % 2 == 1)
      end

      def draw
        pdf.fill_color grid_color
        draw_grid do |row, column|
          pdf.fill_rectangle [column*spacing, row*spacing], spacing, spacing if draw_square?(row, column)
        end
      end
    end
  end
end
