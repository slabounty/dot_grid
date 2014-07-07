require 'spec_helper'

describe "DotGrid::Pattern::Pattern" do

  let(:pdf) { double('pdf') }
  let(:params) { { pdf: pdf, bounds: double('bounds', { upper_left: [0, 0], height: 20.mm, width: 10.mm } ), spacing: 5 } }
  let(:subject) { DotGrid::Pattern::Pattern.new(params) }

  describe "#new" do
    it "calls the post initialize method" do
      expect_any_instance_of(DotGrid::Pattern::Pattern).to receive(:post_initialize)
      DotGrid::Pattern::Pattern.new(params)
    end
  end

  describe "#post_initialize" do
    it "is nil" do
      expect(subject.post_initialize({})).to be_nil
    end
  end

  describe "#rows" do
    it "calculates the rows based on the bounds" do
      expect(subject.rows).to eq(4)
    end
  end

  describe "#columns" do
    it "calculates the rows based on the bounds" do
      expect(subject.columns).to eq(2)
    end
  end

  describe "#draw" do
    it "raises an error" do
      expect { subject.draw }.to raise_error
    end
  end
end
