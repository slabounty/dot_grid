require 'spec_helper'

describe "DotGrid::Pattern::HorizontalRule" do

  describe "#draw" do
    let(:pdf) { double('pdf') }
    let(:params) { { pdf: pdf, bounds: double('bounds', { upper_left: [0, 0], height: 20.mm, width: 10.mm } ), spacing: 5 } }
    let(:subject) { DotGrid::Pattern::HorizontalRule.new(params) }

    before do
      allow(pdf).to receive(:bounding_box).and_yield
      allow(pdf).to receive(:stroke_color)
      allow(pdf).to receive(:stroke_horizontal_line)
    end

    it "sets the fill color" do
      expect(pdf).to receive(:stroke_color)
      subject.draw
    end

    it "calls horizontal line the correct number of times" do
      allow(subject).to receive(:rows).and_return(2)
      expect(pdf).to receive(:stroke_horizontal_line).exactly(2 + 1).times
      subject.draw
    end
  end
end
