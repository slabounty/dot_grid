module DotGrid
  module Pattern
    class Grid < Pattern
      def draw
        pdf.stroke_color grid_color
        draw_grid do |row, column|
          pdf.stroke_horizontal_line(0, bounds.width, :at => row*spacing) if column == 0
          pdf.stroke_vertical_line(0, bounds.height, :at => column*spacing) if row == 0
        end
      end
    end
  end
end
