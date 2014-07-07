module DotGrid
  module Pattern
    class SquareGrid < Pattern

      def draw
        pdf.fill_color grid_color
        pdf.bounding_box(bounds.upper_left, width: bounds.width, height: bounds.height) do
          (0..rows-1).each do |row|
            (0..columns-1).each do |column|
              pdf.fill_rectangle [column*spacing, (row+1)*spacing], spacing, spacing
            end
          end
        end
      end
    end
  end
end

