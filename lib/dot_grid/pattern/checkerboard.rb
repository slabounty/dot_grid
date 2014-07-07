module DotGrid
  module Pattern
    class Checkerboard < Pattern

      def draw
        pdf.fill_color grid_color
        pdf.bounding_box(bounds.upper_left, width: bounds.width, height: bounds.height) do
          (0..rows).each do |row|
            (0..columns).each do |column|
              if (row % 2 == 0 && column % 2 == 0) || (row % 2 == 1 && column % 2 == 1)
                pdf.fill_rectangle [column*spacing, row*spacing], spacing, spacing
              end
            end
          end
        end
      end
    end
  end
end
