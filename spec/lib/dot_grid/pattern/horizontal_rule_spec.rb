require 'spec_helper'

describe "DotGrid::Pattern::HorizontalRule" do
  let(:pdf) { double('pdf') }
  let(:params) { { pdf: pdf, bounds: double('bounds', { height: 20.mm, width: 10.mm } ), spacing: 5 } }
  let(:subject) { DotGrid::Pattern::HorizontalRule.new(params) }

  describe "#rows" do
    it "calculates the rows based on the bounds" do
      expect(subject.rows).to eq(4)
    end
  end

  describe "#draw" do
    before do
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


