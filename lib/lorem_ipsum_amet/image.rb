module LoremIpsumAmet
  module Image

    def placeholder_image(width, height = width)
      dimensions = [width, height].join('x')

      [base_url, dimensions].join('/')
    end

    private

    def base_url
      'http://placehold.it'
    end

  end
end

