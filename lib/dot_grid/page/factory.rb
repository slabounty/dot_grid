module DotGrid
  module Page
    class Factory
      class UnknownPageExeception < Exception; end

      def create_page(page_type, params)
        raise UnknownPageExeception, "Unknown page type: #{page_type}" unless Page.available_pages.include? camel_case(page_type)
        page_object(camel_case(page_type)).new(params)
      end

      def camel_case(page_type)
        return page_type if page_type !~ /_/ && page_type =~ /[A-Z]+.*/
        page_type.split('_').map{|e| e.capitalize}.join
      end

      def page_object(page_type)
        "DotGrid::Page::#{page_type}".split('::').inject(Object) {|o,c| o.const_get c}
      end
    end
  end
end
