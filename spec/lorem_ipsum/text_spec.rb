require 'spec_helper'

describe LoremIpsumAmet::Text do

  it 'returns the full text' do
    expect(LoremIpsumAmet::Text.raw).to be_a String
  end

end
