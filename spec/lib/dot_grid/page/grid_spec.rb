require 'spec_helper'

describe "DotGrid::Page::Grid" do
  describe "#initialize" do
    let(:subject) { DotGrid::Page::Grid.new({}) }

    it "calculates the number of rows" do
      allow(subject).to receive(:page_height).and_return(22)
      allow(subject).to receive(:spacing).and_return(5)
      expect(subject.page_rows).to eq(4)
    end

    it "calculates the number of columns" do
      allow(subject).to receive(:page_width).and_return(44)
      allow(subject).to receive(:spacing).and_return(6)
      expect(subject.page_columns).to eq(7)
    end
  end
end

