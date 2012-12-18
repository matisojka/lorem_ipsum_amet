require 'spec_helper'

describe LoremIpsumAmet::Image do

  subject { Object.new.extend(LoremIpsumAmet::Image) }

  describe '#placeholder_image(:width, :height)' do

    it 'returns an image with the correct dimensions' do
      image_url = subject.placeholder_image(200, 200)
      image_path = download_file(image_url)

      image = SpecImage.new(image_path)

      expect(image.width).to eq(200)
      expect(image.height).to eq(200)
    end
  end

  describe '#placeholder_image(:width_height)' do

    it 'returns an image with the correct dimensions' do
      image_url = subject.placeholder_image(200)
      image_path = download_file(image_url)

      image = SpecImage.new(image_path)

      expect(image.width).to eq(200)
      expect(image.height).to eq(200)
    end
  end

end

