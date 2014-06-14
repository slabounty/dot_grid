require 'prawn'
require "prawn/measurement_extensions"

module DotGrid
  class Generator
    attr_accessor(
      :pdf,
      :file_name,
      :page_size,
      :grid,
      :dot_grid_page,
      :grid_page,
      :margin,
      :pages,
      :planner,
      :planner_page
    )

    def initialize(params)
      @file_name = params[:file_name] || "dotgrid.pdf"
      @page_size = params[:page_size] || "LETTER"
      @margin = params[:margin] || 0.5
      @pages = params[:pages] || 1
      @pdf = Prawn::Document.new(margin: margin, page_size: page_size, skip_page_creation: true)
      params[:pdf] = pdf
      @dot_grid_page = DotGrid::Page::DotGrid.new(params) if params[:dot_grid]
      @planner_page = DotGrid::Page::Planner.new(params) if params[:planner]
      @grid_page = DotGrid::Page::Grid.new(params) if params[:grid]
    end

    def generate
      (1..pages).each do |page|
        planner_page.generate if planner_page
        grid_page.generate if grid_page
        dot_grid_page.generate if dot_grid_page
      end
      pdf.render_file file_name
    end
  end
end
