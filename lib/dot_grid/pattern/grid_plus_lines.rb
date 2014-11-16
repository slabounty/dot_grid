module DotGrid
  module Pattern
    class GridPlusLines < Pattern

      DARK_LINE_WIDTH = 3
      DARK_LINE_SPACING = 3

      def draw_row(row)
        pdf.mask(:line_width) do 
          pdf.line_width (row % DARK_LINE_SPACING == 0) ? DARK_LINE_WIDTH : pdf.line_width 
          pdf.stroke_horizontal_line(0, bounds.width, :at => row*spacing) 
        end 
      end

      def draw_column(column)
        pdf.stroke_vertical_line(0, bounds.height, :at => column*spacing)
      end

      def draw
        pdf.stroke_color grid_color.color_str
        draw_grid do |row, column|
          draw_row(row) if column == 0
          draw_column(column) if row == 0
        end
      end
    end
  end
end

