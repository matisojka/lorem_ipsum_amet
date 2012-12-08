module LoremIpsumAmet
  module ViewHelpers

    def lorem_ipsum(cp = nil, options = {})
      LoremIpsum.lorem_ipsum(cp, options)
    end

  end
end

