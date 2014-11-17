require 'spec_helper'

describe "DotGrid::Pattern::LinePrinter" do
  describe "#draw" do
    let(:pdf) { double('pdf').as_null_object }
    let(:params) { { pdf: pdf, bounds: double('bounds', { upper_left: [0, 0], height: 20.mm, width: 10.mm } ), spacing: 5 } }
    let(:subject) { DotGrid::Pattern::LinePrinter.new(params) }

    before do
      allow(pdf).to receive(:bounding_box).and_yield
    end

    context "when the column is 0" do
      before do
        allow(subject).to receive(:draw_grid).and_yield(2, 0)
      end

      it "draws the holes" do
        expect(subject).to receive(:draw_holes)
        subject.draw
      end

      context "when the row mod 2 is 0" do
        it "draws the bar" do
          expect(pdf).to receive(:fill_rectangle)
          subject.draw
        end
      end
    end
  end


  describe "#draw_holes" do
    let(:pdf) { double('pdf').as_null_object }
    let(:params) { { pdf: pdf, bounds: double('bounds', { upper_left: [0, 0], height: 20.mm, width: 10.mm } ), spacing: 5 } }
    let(:subject) { DotGrid::Pattern::LinePrinter.new(params) }

    it "sets the fill color for the holes" do
      expect(pdf).to receive(:fill_color)
      subject.draw_holes(1)
    end

    it "draws both holes" do
      expect(pdf).to receive(:fill_circle).twice
      subject.draw_holes(1)
    end
  end
end
