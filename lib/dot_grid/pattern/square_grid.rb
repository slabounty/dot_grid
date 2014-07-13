module DotGrid
  module Pattern
    class SquareGrid < Pattern
      def draw
        pdf.fill_color grid_color
        draw_grid(true) do |row, column|
          pdf.fill_rectangle [column*spacing, (row+1)*spacing], spacing, spacing
        end
      end
    end
  end
end
