require 'spec_helper'

describe "DotGrid::Page::HorizontalRule" do
  describe "#initialize" do
    let(:subject) { DotGrid::Page::HorizontalRule.new({}) }

    it "calculates the number of rows" do
      allow(subject).to receive(:page_height).and_return(22)
      allow(subject).to receive(:spacing).and_return(5)
      expect(subject.page_rows).to eq(4)
    end
  end
end

