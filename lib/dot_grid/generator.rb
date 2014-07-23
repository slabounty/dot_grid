require 'prawn'
require "prawn/measurement_extensions"

module DotGrid
  class Generator
    attr_accessor(
      :pdf,
      :file_name,
      :page_size,
      :margin,
      :pages,
      :page_types
    )

    def initialize(params)
      @file_name = params[:file_name] || "dotgrid.pdf"
      @page_size = params[:page_size] || "LETTER"
      @margin = params[:margin] || 0.5
      @page_types = params[:page_types] ? params[:page_types].split(",") : ["planner"]
      @pdf = Prawn::Document.new(margin: margin, page_size: page_size, skip_page_creation: true)
      params[:pdf] = pdf
      @pages = create_pages(params)
    end

    def create_pages(params)
      page_types.map do |p|
        DotGrid::Page::Factory.build(p.strip, params.clone)
      end
    end

    def generate
      pages.each { |page| page.generate }
      pdf.render_file file_name
    end
  end
end
