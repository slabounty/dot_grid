require 'spec_helper'

describe "DotGrid::Page::GridPlusLines" do
  describe "#post_initialize" do
    let(:subject) { DotGrid::Page::GridPlusLines.new({})}

    before do
      allow(::DotGrid::Pattern::GridPlusLines).to receive(:new)
    end

    it "draws the pattern" do
      expect(subject).to receive(:add_pattern)
      subject.post_initialize({})
    end
  end
end

