require 'spec_helper'

describe "DotGrid::Page::DotGrid" do
  describe "#post_initialize" do
    let(:subject) { DotGrid::Page::DotGrid.new({})}

    before do
      allow(::DotGrid::Pattern::DotGrid).to receive(:new)
    end

    it "adds the pattern" do
      expect(subject).to receive(:add_pattern)
      subject.post_initialize({})
    end
  end
end
