module DotGrid
  module Pattern
    class HorizontalRule < Pattern

      def draw
        pdf.stroke_color grid_color
        (0..rows).each do |row|
          pdf.stroke_horizontal_line(0, bounds.width, :at => row*spacing)
        end
      end
    end
  end
end
