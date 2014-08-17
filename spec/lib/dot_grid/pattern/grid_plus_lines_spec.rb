require 'spec_helper'

describe "DotGrid::Pattern::GridPlusLines" do
  let(:pdf) { double('pdf').as_null_object }
  let(:params) { { pdf: pdf, bounds: double('bounds', { upper_left: [0, 0], height: 20.mm, width: 10.mm } ), spacing: 5 } }
  let(:subject) { DotGrid::Pattern::GridPlusLines.new(params) }

  describe "draw_row" do
    before do
      allow(pdf).to receive(:mask).and_yield
    end

    it "masks the line width" do
      expect(pdf).to receive(:mask).with(:line_width)
      subject.draw_row(0)
    end

    it "sets the line width" do
      expect(pdf).to receive(:line_width)
      subject.draw_row(0)
    end

    it "draws the horizontal line" do
      expect(pdf).to receive(:stroke_horizontal_line)
      subject.draw_row(0)
    end
  end

  describe "draw_column" do
    it "draws a vertical line" do
      expect(pdf).to receive(:stroke_vertical_line)
      subject.draw_column(0)
    end
  end

  describe "#draw" do

    before do
      allow(pdf).to receive(:mask).and_yield
      allow(pdf).to receive(:bounding_box).and_yield
    end

    it "sets the fill color" do
      expect(pdf).to receive(:stroke_color)
      subject.draw
    end

    it "draws the horizontal lines" do
      allow(subject).to receive(:rows).and_return(2)
      expect(subject).to receive(:draw_row).exactly(3).times
      subject.draw
    end

    it "draws the vertical lines" do
      allow(subject).to receive(:columns).and_return(3)
      expect(subject).to receive(:draw_column).exactly(4).times
      subject.draw
    end
  end
end
