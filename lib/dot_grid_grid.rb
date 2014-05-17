class DotGridGrid < DotGridPage
  attr_accessor(
    :dot_weight,
    :grid_color,
    :spacing,
  )

  def initialize(params)
    super
  end


  def page_rows(pdf)
    (page_height(pdf) / spacing).floor
  end

  def page_columns(pdf)
    (page_width(pdf) / spacing).floor
  end

  def generate(pdf)
    pdf.start_new_page
    num_columns = page_columns(pdf)
    num_rows = page_rows(pdf)
    draw_dot_grid(pdf, num_rows, num_columns, 0, pdf.bounds.height)
  end
end
