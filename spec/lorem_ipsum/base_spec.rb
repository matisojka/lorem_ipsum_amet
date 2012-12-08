require 'spec_helper'

describe LoremIpsumAmet::Base do

  subject { LoremIpsumAmet::Base }

  let(:first_paragraph) do
    %Q(Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam cursus. Morbi ut mi. Nullam enim leo, egestas id, condimentum at, laoreet mattis, massa. Sed eleifend nonummy diam. Praesent mauris ante, elementum et, bibendum at, posuere sit amet, nibh. Duis tincidunt lectus quis dui viverra vestibulum. Suspendisse vulputate aliquam dui. Nulla elementum dui ut augue. Aliquam vehicula mi at mauris. Maecenas placerat, nisl at consequat rhoncus, sem nunc gravida justo, quis eleifend arcu velit quis lacus. Morbi magna magna, tincidunt a, mattis non, imperdiet vitae, tellus. Sed odio est, auctor ac, sollicitudin in, consequat vitae, orci. Fusce id felis. Vivamus sollicitudin metus eget eros.)
  end

  let(:second_paragraph) do
    %Q(Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In posuere felis nec tortor. Pellentesque faucibus. Ut accumsan ultricies elit. Maecenas at justo id velit placerat molestie. Donec dictum lectus non odio. Cras a ante vitae enim iaculis aliquam. Mauris nunc quam, venenatis nec, euismod sit amet, egestas placerat, est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras id elit. Integer quis urna. Ut ante enim, dapibus malesuada, fringilla eu, condimentum quis, tellus. Aenean porttitor eros vel dolor. Donec convallis pede venenatis nibh. Duis quam. Nam eget lacus. Aliquam erat volutpat. Quisque dignissim congue leo.)
  end

  let(:raw_text) { LoremIpsumAmet::Text.raw }
  let(:long_text) { [raw_text, raw_text].join("\n")[0..6000] }


  describe '.lorem_ipsum' do
    it 'returns the first paragraph by default' do
      expect(subject.lorem_ipsum).to eq(first_paragraph)
    end

    describe 'characters' do

      it 'returns a given amount of characters' do
        expect(subject.lorem_ipsum(15)).to eq(first_paragraph[0..15])
      end

      it 'returns a given amount of characters (more characters than raw text length)' do
        expect(subject.lorem_ipsum(6000)).to eq(long_text)
      end

    end

    describe 'paragraphs' do

      it 'returns a given amount of paragraphs' do
        two_paragraphs = [first_paragraph, second_paragraph].join("\n")
        expect(subject.lorem_ipsum(paragraphs: 2)).to eq(two_paragraphs)
      end

      it 'returns a given amount of paragraphs (more paragraphs than in raw text)' do
        seven_paragraphs = [raw_text, first_paragraph].join("\n")
        expect(subject.lorem_ipsum(paragraphs: 7)).to eq(seven_paragraphs)
      end

      describe 'join element' do

        it 'returns paragraphs separated by the given join element' do
          two_paragraphs = [first_paragraph, second_paragraph].join('\r\n')

          expect(subject.lorem_ipsum(paragraphs: 2, join: '\r\n')).to eq(two_paragraphs)
        end

        it 'returns paragraphs separated by <br /> if the html option is set to true' do
          two_paragraphs = [first_paragraph, second_paragraph].join('<br />')

          expect(subject.lorem_ipsum(paragraphs: 2, html: true)).to eq(two_paragraphs)
        end

      end

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
