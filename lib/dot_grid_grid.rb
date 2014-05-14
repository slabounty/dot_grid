class DotGridGrid < DotGridPage
  attr_accessor(
    :dot_weight,
    :grid_color,
    :spacing,
  )

  def initialize(params)
    @dot_weight = params[:dot_weight]
    @grid_color = params[:grid_color]
    @spacing = params[:spacing].mm
  end


  def page_rows(pdf)
    (pdf.bounds.height / spacing).floor
  end

  def page_columns(pdf)
    (pdf.bounds.width / spacing).floor
  end

  def generate(pdf)
    pdf.start_new_page
    num_columns = page_columns(pdf)
    num_rows = page_rows(pdf)
    pdf.fill_color grid_color
    (0..num_rows).each do |row|
      (0..num_columns).each do |col|
        pdf.fill_circle [col*spacing, row*spacing], dot_weight
      end
    end
  end
end
