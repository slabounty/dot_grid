module DotGrid
  module Pattern
    class Grid < Pattern
      def draw
        pdf.stroke_color grid_color
        (0..rows).each do |row|
          pdf.stroke_horizontal_line(0, bounds.width, :at => row*spacing)
        end
        (0..columns).each do |column|
          pdf.stroke_vertical_line(0, bounds.height, :at => column*spacing)
        end
      end
    end
  end
end
