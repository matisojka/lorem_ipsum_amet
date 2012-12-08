require 'spec_helper'

describe LoremIpsumAmet::Base do

  subject { LoremIpsumAmet::Base }

  let(:first_paragraph) do
    %Q(Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam cursus. Morbi ut mi. Nullam enim leo, egestas id, condimentum at, laoreet mattis, massa. Sed eleifend nonummy diam. Praesent mauris ante, elementum et, bibendum at, posuere sit amet, nibh. Duis tincidunt lectus quis dui viverra vestibulum. Suspendisse vulputate aliquam dui. Nulla elementum dui ut augue. Aliquam vehicula mi at mauris. Maecenas placerat, nisl at consequat rhoncus, sem nunc gravida justo, quis eleifend arcu velit quis lacus. Morbi magna magna, tincidunt a, mattis non, imperdiet vitae, tellus. Sed odio est, auctor ac, sollicitudin in, consequat vitae, orci. Fusce id felis. Vivamus sollicitudin metus eget eros.)
  end

  let(:raw_text) { LoremIpsumAmet::Text.raw }

  describe '.lorem_ipsum' do
    it 'returns the first paragraph by default' do
      expect(subject.lorem_ipsum).to eq(first_paragraph)
    end

    it 'returns a given amount of characters' do
      expect(subject.lorem_ipsum(15)).to eq(first_paragraph[0..15])
    end

    it 'returns a given amount of characters (more characters than raw text length)' do
      long_text = [raw_text, raw_text].join("\n")[0..6000]

      expect(subject.lorem_ipsum(6000)).to eq(long_text)
    end

  end

  describe '.text' do
    it 'is an alias of .lorem_ipsum' do
      expect(subject.method(:text)).to eq(subject.method(:lorem_ipsum))
    end
  end

  describe '.full' do
    it 'returns the full text' do
      expect(subject.full).to eq(raw_text)
    end
  end

end
