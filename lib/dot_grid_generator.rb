require 'prawn'
require "prawn/measurement_extensions"

class DotGridGenerator
  attr_accessor(
    :file_name,
    :page_size,
    :grid,
    :grid_page,
    :margin,
    :pages,
    :planner,
    :planner_page
  )

  def initialize(params)
    @file_name = params[:file_name]
    @page_size = params[:page_size]
    @margin = params[:margin]
    @pages = params[:pages]
    @grid_page = DotGridGrid.new(params) if params[:grid]
    @planner_page = DotGridPlanner.new(params) if params[:planner]
  end

  def generate
    Prawn::Document.generate(file_name, margin: margin, page_size: page_size, skip_page_creation: true) do |pdf|
      (1..pages).each do |page|
        planner_page.generate(pdf) if planner_page
        grid_page.generate(pdf) if grid_page
      end
    end
  end
end
