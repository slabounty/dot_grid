require 'spec_helper'

describe "DotGrid::Page::Factory" do
  describe ".build" do
    context "when the page is unknown" do
      it "raises an exception" do
        expect {DotGrid::Page::Factory.build('xyz', {})}.to raise_error( DotGrid::Page::Factory::UnknownPageExeception)
      end
    end

    context "when the page is known" do
      it "builds the page" do
        expect(::DotGrid::Page::Planner).to receive(:new)
        DotGrid::Page::Factory.build('planner', {})
      end
    end
  end
end
