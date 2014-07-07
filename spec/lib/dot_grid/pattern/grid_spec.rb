require 'spec_helper'

describe "DotGrid::Pattern::Grid" do
  describe "#draw" do
    let(:pdf) { double('pdf') }
    let(:params) { { pdf: pdf, bounds: double('bounds', { upper_left: [0, 0], height: 20.mm, width: 10.mm } ), spacing: 5 } }
    let(:subject) { DotGrid::Pattern::Grid.new(params) }

    before do
      allow(pdf).to receive(:stroke_color)
      allow(pdf).to receive(:bounding_box).and_yield
      allow(pdf).to receive(:stroke_horizontal_line)
      allow(pdf).to receive(:stroke_vertical_line)
    end

    it "sets the fill color" do
      expect(pdf).to receive(:stroke_color)
      subject.draw
    end

    it "draws the horizontal lines" do
      allow(subject).to receive(:rows).and_return(2)
      expect(pdf).to receive(:stroke_horizontal_line).exactly(3).times
      subject.draw
    end

    it "calls fill rectangle the correct number of times" do
      allow(subject).to receive(:columns).and_return(3)
      expect(pdf).to receive(:stroke_vertical_line).exactly(4).times
      subject.draw
    end
  end
end
