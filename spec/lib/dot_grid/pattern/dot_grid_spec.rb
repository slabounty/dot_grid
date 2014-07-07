require 'spec_helper'

describe "DotGrid::Pattern::DotGrid" do
  describe "#draw" do
    let(:pdf) { double('pdf') }
    let(:params) { { pdf: pdf, bounds: double('bounds', { upper_left: [0, 0], height: 20.mm, width: 10.mm } ), spacing: 5 } }
    let(:subject) { DotGrid::Pattern::DotGrid.new(params) }

    before do
      allow(pdf).to receive(:bounding_box).and_yield
      allow(pdf).to receive(:fill_color)
      allow(pdf).to receive(:fill_circle)
    end

    it "sets the fill color" do
      expect(pdf).to receive(:fill_color)
      subject.draw
    end

    it "calls fill circle the correct number of times" do
      allow(subject).to receive(:rows).and_return(2)
      allow(subject).to receive(:columns).and_return(3)
      expect(pdf).to receive(:fill_circle).exactly(3*4).times
      subject.draw
    end
  end
end
