module DotGrid
  module Page
    class Factory
      class UnknownPageExeception < Exception; end

      PAGES = {
        'dot_grid' => ::DotGrid::Page::DotGrid,
        'planner' => ::DotGrid::Page::Planner,
        'grid' => ::DotGrid::Page::Grid,
        'horizontal_rule' => ::DotGrid::Page::HorizontalRule,
        'checkerboard' => ::DotGrid::Page::Checkerboard
      }

      def self.build(page_type, params)
        raise UnknownPageExeception, "Unknown page type: #{page_type}" unless PAGES[page_type]
        PAGES[page_type].new(params)
      end
    end
  end
end
