require 'spec_helper'

describe LoremIpsum::Text do

  it 'returns the full text' do
    expect(LoremIpsum::Text.raw).to be_a String
  end

end
