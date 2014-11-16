module DotGrid
  module Pattern
    class HorizontalRule < Pattern
      def draw
        pdf.stroke_color grid_color.color_str
        draw_grid do |row, column|
          pdf.stroke_horizontal_line(0, bounds.width, :at => row*spacing) if column == 0
        end
      end
    end
  end
end
