module DotGrid
  class Document
    attr_accessor(
      :document,
      :pdf,
      :file_name,
      :orientation,
      :page_size,
      :margin,
      :pages,
      :page_types
    )

    def initialize(params = {})
      @file_name = params[:file_name] || "dotgrid.pdf"
      @page_size = params[:page_size] ? parse_page_size(params[:page_size]) : "LETTER"
      @orientation = params[:orientation] ? params[:orientation].downcase.to_sym : :portrait
      @margin = params[:margin] || 0.0
      @page_types = params[:page_types] ? params[:page_types].downcase.split(",").map { |w| w.strip } : ["planner"]

      @pdf = Prawn::Document.new(margin: margin, page_size: page_size, skip_page_creation: true, page_layout: orientation)
      @pages = create_pages(page_params(params))
    end

    def page_params(params)
      {
        pdf: @pdf,
        dot_weight: (params[:dot_weight] || 1.5),
        spacing: (params[:spacing] || 5),
        #grid_color: params[:grid_color] || "B3B3B3",
        #planner_color_1: params[:planner_color_1] || "CCCCCC",
        #planner_color_2: params[:planner_color_2] || "0099ff",
        grid_color: ::DotGrid::Color.new(params[:grid_color] || "B3B3B3"),
        planner_color_1: ::DotGrid::Color.new(params[:planner_color_1] || "CCCCCC"),
        planner_color_2: ::DotGrid::Color.new(params[:planner_color_2] || "0099ff"),
      }
    end

    def parse_page_size(page_size)
      return page_size unless p = /(?'w'\d+\.{0,1}\d*)x(?'h'\d+\.{0,1}\d*)(?'u'[a-z]{2})/.match(page_size)
      return [p[:w].to_f.send(p[:u]), p[:h].to_f.send(p[:u])]
    end

    def create_pages(params)
      page_types.map do |p|
        DotGrid::Page::Factory.build(p, params.clone)
      end
    end

    def generate
      pages.each { |page| page.generate }
      pdf.render_file file_name
    end
  end
end
