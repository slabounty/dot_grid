require 'spec_helper'

describe "DotGrid::Page::DotDash" do
  describe "#post_initialize" do
    let(:subject) { DotGrid::Page::DotDash.new({})}

    before do
      allow(::DotGrid::Pattern::DotDash).to receive(:new)
    end

    it "adds the pattern" do
      expect(subject).to receive(:add_pattern)
      subject.post_initialize({})
    end
  end
end

