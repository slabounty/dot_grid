module DotGrid
  class BoundingBox
    attr_accessor(
      :upper_left,
      :width,
      :height
    )

    def initialize(params)
      @upper_left = params[:upper_left]
      @width = params[:width]
      @height = params[:height]
    end
  end
end
