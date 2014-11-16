require 'spec_helper'

describe "DotGrid::Color" do
  describe "#initialize" do
    let(:subject) { DotGrid::Color.new }

    it "normalizes the color" do
      expect(DotGrid::Color).to receive(:normalize)
      DotGrid::Color.new
    end
  end

  describe ".normalize" do
    it "normalizes prawn colors" do
      expect(DotGrid::Color.normalize("00ff00")).to eq("00ff00")
    end

    it "normalizes CSS rgb colors" do
      expect(DotGrid::Color.normalize("#00ff00")).to eq("00ff00")
    end

    it "throws an unknow color format exception for an unknown format" do
      expect {DotGrid::Color.normalize("hello")}.to raise_error
    end
  end

  describe "#color_str" do
    let(:subject) { DotGrid::Color.new("#0ab1c2") }

    it "returns the prawn color format" do
      expect(subject.color_str).to eq("0ab1c2")
    end
  end

  describe "#css_color" do
    let(:subject) { DotGrid::Color.new("0ab1c2") }

    it "returns the css color format" do
      expect(subject.css_color).to eq("#0ab1c2")
    end
  end
end
