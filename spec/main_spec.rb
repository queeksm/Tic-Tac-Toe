# frozen_string_literal: true

#spec/main_spec.rb

require './bin/main_alt.rb'

RSpec.describe Outputs do
  describe "#sampler" do
    it "samples a string randomly from an array" do
      outputs = Outputs.new
      expect(outputs.sampler(['a', 'b', 'c'])).to eql(String)
    end
  end
end