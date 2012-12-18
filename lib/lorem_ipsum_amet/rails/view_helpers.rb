module LoremIpsumAmet
  module ViewHelpers

    def lorem_ipsum(cp = nil, options = {})
      options = { html: true }.merge(options)

      LoremIpsum.lorem_ipsum(cp, options)
    end

    def placeholder_image(width, height = width)
      LoremIpsum.placeholder_image(width, height)
    end

  end
end

