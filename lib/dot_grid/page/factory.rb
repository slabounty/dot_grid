module DotGrid
  module Page
    class Factory
      class UnknownPageExeception < Exception; end

      PAGES = {
        'dot_grid'        => ::DotGrid::Page::DotGrid,
        'planner'         => ::DotGrid::Page::Planner,
        'grid'            => ::DotGrid::Page::Grid,
        'grid_plus_lines' => ::DotGrid::Page::GridPlusLines,
        'horizontal_rule' => ::DotGrid::Page::HorizontalRule,
        'checkerboard'    => ::DotGrid::Page::Checkerboard,
        'dot_dash'        => ::DotGrid::Page::DotDash,
        'line_printer'    => ::DotGrid::Page::LinePrinter,
      }

      def self.build(page_type, params)
        raise UnknownPageExeception, "Unknown page type: #{page_type}" unless PAGES[page_type]
        PAGES[page_type].new(params)
      end
    end
  end
end
