module DotGrid
  class Color
    class UnknownColorFormatException < Exception; end

    def initialize(color = "000000")
      @color = DotGrid::Color.normalize(color)
    end

    def self.normalize(color)
      if color =~ /\A\h{6}\z/
        return color
      elsif color =~ /\A#\h{6}\z/
        return color[1..6]
      else
        raise UnknownColorFormatException, "Unknown color format: #{color}"
      end
    end

    def color_str
      @color
    end

    def css_color
      "##{@color}"
    end
  end
end
