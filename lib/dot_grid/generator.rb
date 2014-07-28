require 'prawn'
require "prawn/measurement_extensions"

module DotGrid
  class Generator
    attr_accessor(
      :document
    )

    def initialize(params)
      @document = DotGrid::Document.new(params)
    end

    def generate
      document.generate
    end
  end
end
