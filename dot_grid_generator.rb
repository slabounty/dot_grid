require 'prawn'
require "prawn/measurement_extensions"

class DotGridGenerator
  attr_accessor(
    :file_name,
    :page_size,
    :dot_weight,
    :margin,
    :grid_color,
    :pages,
    :spacing
  )
  def initialize(params)
    @file_name = params[:file_name]
    @page_size = params[:page_size]
    @dot_weight = params[:dot_weight]
    @margin = params[:margin]
    @grid_color = params[:grid_color]
    @pages = params[:pages]
    @spacing = params[:spacing].mm
  end

  def generate
    Prawn::Document.generate(file_name, margin: margin, page_size: page_size) do |pdf|
      (1..pages).each do |page|
        generate_page(pdf)
        pdf.start_new_page unless page == pages
      end
    end
  end

  def generate_page(pdf)
    num_columns = (pdf.bounds.width / spacing).floor
    num_rows = (pdf.bounds.height / spacing).floor
    pdf.fill_color grid_color
    (0..num_rows).each do |row|
      (0..num_columns).each do |col|
        pdf.fill_circle [col*spacing, row*spacing], dot_weight
      end
    end
  end
end
