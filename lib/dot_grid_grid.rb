class DotGridGrid < DotGridPage
  attr_accessor(
    :dot_weight,
    :grid_color,
    :spacing,
  )

  def initialize(params)
    super
  end


  def page_rows
    (page_height / spacing).floor
  end

  def page_columns
    (page_width / spacing).floor
  end

  def generate
    pdf.start_new_page
    num_columns = page_columns
    num_rows = page_rows
    draw_dot_grid(num_rows, num_columns, 0, pdf.bounds.height)
  end
end
