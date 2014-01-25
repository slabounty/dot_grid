require 'prawn'
require "prawn/measurement_extensions"

class DotGridGenerator
  attr_accessor(
    :file_name,
    :page_size,
    :grid,
    :dot_weight,
    :margin,
    :grid_color,
    :pages,
    :spacing,
    :planner,
    :planner_color_1,
    :planner_color_2
  )
  def initialize(params)
    @file_name = params[:file_name]
    @page_size = params[:page_size]
    @grid = params[:grid]
    @dot_weight = params[:dot_weight]
    @margin = params[:margin]
    @grid_color = params[:grid_color]
    @pages = params[:pages]
    @spacing = params[:spacing].mm
    @planner = params[:planner]
    @planner_color_1 = params[:planner_color_1]
    @planner_color_2 = params[:planner_color_2]
  end

  def generate
    Prawn::Document.generate(file_name, margin: margin, page_size: page_size, skip_page_creation: true) do |pdf|
      (1..pages).each do |page|
        if planner
          pdf.start_new_page
          generate_planner_page(pdf)
        end
        if grid
          pdf.start_new_page
          generate_dot_grid_page(pdf)
        end
      end
    end
  end

  def generate_planner_page(pdf)
    width = pdf.bounds.width
    height = pdf.bounds.height
    header_height = 0.05 * height

    square_grid_rows = 45
    square_grid_columns = 13

    dot_grid_rows = 46
    dot_grid_columns = 28

    header_left_color = planner_color_1
    header_left_start = width*0.05
    header_left_width = square_grid_columns*spacing

    header_gap_start = header_left_start + header_left_width
    header_gap_width = width*0.03

    header_right_color = planner_color_2
    header_right_start = header_gap_start + header_gap_width
    header_right_width = width - header_right_start

    # Header left
    pdf.fill_color header_left_color
    pdf.fill_rectangle [header_left_start, height], header_left_width, header_height

    # Header right
    pdf.fill_color header_right_color
    pdf.fill_rectangle [header_right_start, height], header_right_width, header_height

    # Square Grid Left
    pdf.fill_color header_left_color
    (1..square_grid_rows).each do |row|
      (1..square_grid_columns).each do |col|
        pdf.fill_rectangle [header_left_start + (col-1)*spacing, height - header_height - spacing - (row-1)*spacing], spacing-1 ,spacing-1
      end
    end

    # Dot Grid Right
    pdf.fill_color grid_color
    (1..dot_grid_rows).each do |row|
      (1..dot_grid_columns).each do |col|
        pdf.fill_circle [header_right_start + (col-1)*spacing, height - header_height - spacing - (row-1)*spacing], dot_weight
      end
    end

    # Footer
    footer_color = planner_color_1
    footer_start = header_left_start
    footer_height = header_height * 2
    footer_width = width - footer_start
    pdf.fill_color footer_color
    pdf.fill_rectangle [footer_start, footer_height], footer_width, footer_height

  end

  def page_rows(pdf)
    (pdf.bounds.height / spacing).floor
  end

  def page_columns(pdf)
    (pdf.bounds.width / spacing).floor
  end

  def generate_dot_grid_page(pdf)
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
