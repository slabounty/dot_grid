require 'spec_helper'

describe "DotGrid::CLI" do
  describe ".execute" do
    let(:argv) { [] }
    let(:generator) { double('generator') }

    before do
      allow(DotGrid::Generator).to receive(:new).and_return(generator)
      allow(generator).to receive(:generate)
    end

    it "uses trollop to process the options" do
      expect(Trollop).to receive(:options).with(argv)
      DotGrid::CLI.execute(argv)
    end

    it "creates a new generator" do
      expect(DotGrid::Generator).to receive(:new).and_return(generator)
      DotGrid::CLI.execute([])
    end

    it "calls generate on the generator" do
      expect(generator).to receive(:generate)
      DotGrid::CLI.execute([])
    end
  end
end
