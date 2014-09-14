require 'spec_helper'

describe "DotGrid::Pattern::DotDash" do
  describe "#draw" do
    let(:pdf) { double('pdf').as_null_object }
    let(:params) { { pdf: pdf, bounds: double('bounds', { upper_left: [0, 0], height: 20.mm, width: 10.mm } ), spacing: 5 } }
    let(:subject) { DotGrid::Pattern::DotDash.new(params) }

    before do
      allow(pdf).to receive(:bounding_box).and_yield
    end

    it "sets the fill color" do
      expect(pdf).to receive(:fill_color)
      subject.draw
    end

    it "sets the line width" do
      expect(pdf).to receive(:line_width)
      subject.draw
    end

    it "sets the stroke color" do
      expect(pdf).to receive(:stroke_color)
      subject.draw
    end

    it "calls fill circle the correct number of times" do
      allow(subject).to receive(:rows).and_return(2)
      allow(subject).to receive(:columns).and_return(3)
      expect(pdf).to receive(:fill_circle).exactly(3*4).times
      subject.draw
    end

    it "calls horizontal line the correct number of times" do
      allow(subject).to receive(:rows).and_return(2)
      allow(subject).to receive(:columns).and_return(3)
      expect(pdf).to receive(:stroke_horizontal_line).exactly(3*4).times
      subject.draw
    end

    it "calls vertical line the correct number of times" do
      allow(subject).to receive(:rows).and_return(2)
      allow(subject).to receive(:columns).and_return(3)
      expect(pdf).to receive(:stroke_vertical_line).exactly(3*4).times
      subject.draw
    end
  end
end

