class DotGridPage
  attr_accessor(
    :dot_weight,
    :grid_color,
    :spacing
  )

  def initialize(params)
    @dot_weight = params[:dot_weight]
    @grid_color = params[:grid_color]
    @spacing = params[:spacing].mm
  end

  def page_width(pdf)
    pdf.bounds.width
  end

  def page_height(pdf)
    pdf.bounds.height
  end

  def draw_dot_grid(pdf, rows, columns, left_start, height_start)
    pdf.fill_color grid_color
    (1..rows).each do |row|
      (1..columns).each do |col|
        pdf.fill_circle [left_start + (col-1)*spacing, height_start - spacing - (row-1)*spacing], dot_weight
      end
    end
  end
end
