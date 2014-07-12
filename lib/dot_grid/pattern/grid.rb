module DotGrid
  module Pattern
    class Grid < Pattern
      def draw_rows
        (0..rows).each do |row|
          pdf.stroke_horizontal_line(0, bounds.width, :at => row*spacing)
        end
      end

      def draw_columns
        (0..columns).each do |column|
          pdf.stroke_vertical_line(0, bounds.height, :at => column*spacing)
        end
      end

      def draw
        pdf.stroke_color grid_color
        pdf.bounding_box(bounds.upper_left, width: bounds.width, height: bounds.height) do
          draw_rows
          draw_columns
        end
      end
    end
  end
end
