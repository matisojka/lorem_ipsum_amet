require 'spec_helper'

describe LoremIpsumAmet::Base do

  let(:first_paragraph) do
    %Q(Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nam cursus. Morbi ut mi. Nullam enim leo, egestas id, condimentum at, laoreet mattis, massa. Sed eleifend nonummy diam. Praesent mauris ante, elementum et, bibendum at, posuere sit amet, nibh. Duis tincidunt lectus quis dui viverra vestibulum. Suspendisse vulputate aliquam dui. Nulla elementum dui ut augue. Aliquam vehicula mi at mauris. Maecenas placerat, nisl at consequat rhoncus, sem nunc gravida justo, quis eleifend arcu velit quis lacus. Morbi magna magna, tincidunt a, mattis non, imperdiet vitae, tellus. Sed odio est, auctor ac, sollicitudin in, consequat vitae, orci. Fusce id felis. Vivamus sollicitudin metus eget eros.)
  end

  let(:second_paragraph) do
    %Q(Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In posuere felis nec tortor. Pellentesque faucibus. Ut accumsan ultricies elit. Maecenas at justo id velit placerat molestie. Donec dictum lectus non odio. Cras a ante vitae enim iaculis aliquam. Mauris nunc quam, venenatis nec, euismod sit amet, egestas placerat, est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras id elit. Integer quis urna. Ut ante enim, dapibus malesuada, fringilla eu, condimentum quis, tellus. Aenean porttitor eros vel dolor. Donec convallis pede venenatis nibh. Duis quam. Nam eget lacus. Aliquam erat volutpat. Quisque dignissim congue leo.)
  end

  let(:raw_text) { LoremIpsumAmet::Text.raw }
  let(:long_text) { [raw_text, raw_text].join("\n")[0...6000] }

  describe '#lorem_ipsum' do
    it 'returns the first paragraph by default' do
      expect(subject.lorem_ipsum).to eq(first_paragraph)
    end

    describe 'characters' do

      it 'returns a given amount of characters' do
        expect(subject.lorem_ipsum(15)).to eq(first_paragraph[0...15])
      end

      it 'returns a given amount of characters (more characters than raw text length)' do
        expect(subject.lorem_ipsum(6000)).to eq(long_text)
      end

      it 'returns a given amount of characters (alternative syntax)' do
        expect(subject.lorem_ipsum(characters: 20)).to eq(first_paragraph[0...20])
      end

      it 'returns a given amount of characters (short syntax)' do
        expect(subject.lorem_ipsum(c: 20)).to eq(first_paragraph[0...20])
      end

      describe 'join element' do

        it 'returns paragraphs separated by the given join element' do
          two_paragraphs = [first_paragraph, second_paragraph].join("\r\n")

          expect(subject.lorem_ipsum(two_paragraphs.length, join: "\r\n")).to eq(two_paragraphs)
        end

        it 'returns paragraphs separated by <br /> if the html option is set to true' do
          two_paragraphs = [first_paragraph, second_paragraph].join('<br />')

          expect(subject.lorem_ipsum(two_paragraphs.length, html: true)).to eq(two_paragraphs)
        end

      end

      describe '#c' do

        it 'returns the given number of characters' do
          expect(subject.c(25)).to eq(first_paragraph[0...25])
        end

        it 'returns the given number of characters with custom join' do
          two_paragraphs = [first_paragraph, second_paragraph].join("\r\n")

          expect(subject.c(two_paragraphs.length, "\r\n")).to eq(two_paragraphs)
        end

      end

    end

    describe 'paragraphs' do

      it 'returns a given amount of paragraphs' do
        two_paragraphs = [first_paragraph, second_paragraph].join("\n")
        expect(subject.lorem_ipsum(paragraphs: 2)).to eq(two_paragraphs)
      end

      it 'returns a given amount of paragraphs (short syntax)' do
        two_paragraphs = [first_paragraph, second_paragraph].join("\n")
        expect(subject.lorem_ipsum(p: 2)).to eq(two_paragraphs)
      end

      it 'returns a given amount of paragraphs (more paragraphs than in raw text)' do
        seven_paragraphs = [raw_text, first_paragraph].join("\n")
        expect(subject.lorem_ipsum(paragraphs: 7)).to eq(seven_paragraphs)
      end

      describe 'join element' do

        it 'returns paragraphs separated by the given join element' do
          two_paragraphs = [first_paragraph, second_paragraph].join("\r\n")

          expect(subject.lorem_ipsum(paragraphs: 2, join: "\r\n")).to eq(two_paragraphs)
        end

        it 'returns paragraphs separated by <br /> if the html option is set to true' do
          two_paragraphs = [first_paragraph, second_paragraph].join('<br />')

          expect(subject.lorem_ipsum(paragraphs: 2, html: true)).to eq(two_paragraphs)
        end


        describe '#p' do

          it 'returns the given number of paragraphs' do
            two_paragraphs = [first_paragraph, second_paragraph].join("\n")

            expect(subject.p(2)).to eq(two_paragraphs)
          end

          it 'returns the given number of paragraphs (with custom join)' do
            two_paragraphs = [first_paragraph, second_paragraph].join("\r\n")

            expect(subject.p(2, "\r\n")).to eq(two_paragraphs)
          end

        end

      end

    end

    describe 'words' do

      it 'returns a given amount of words' do
        eight_words = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'

        expect(subject.lorem_ipsum(words: 8)).to eq(eight_words)
      end

      it 'returns a given amount of words (short syntax)' do
        eight_words = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'

        expect(subject.lorem_ipsum(w: 8)).to eq(eight_words)
      end

      it 'returns a given amount of words (more than in the whole text)' do
        seven_paragraphs = [raw_text, first_paragraph].join("\n")
        words = seven_paragraphs.split.size

        expect(subject.lorem_ipsum(words: words)).to eq(seven_paragraphs)
      end

      it 'returns a given amount of words separated by \r\n' do
        seven_paragraphs = [raw_text, first_paragraph].join("\n").gsub("\n", "\r\n")
        words = seven_paragraphs.split.size

        expect(subject.lorem_ipsum(words: words, join: "\r\n")).to eq(seven_paragraphs)
      end

      describe '#w' do

        it 'returns the given amount of words' do
          eight_words = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'

          expect(subject.w(8)).to eq(eight_words)
        end

        it 'returns a given amount of words separated by \r\n' do
          seven_paragraphs = [raw_text, first_paragraph].join("\n").gsub("\n", "\r\n")
          words = seven_paragraphs.split.size

          expect(subject.w(words, "\r\n")).to eq(seven_paragraphs)
        end

      end

    end

    describe 'text format' do

      it 'returns title cased text' do
        title_cased = 'Lorem Ipsum Dolor Sit Amet, Consectetuer Adipiscing Elit.'

        expect(subject.lorem_ipsum(words: 8, format: :title_case)).to eq(title_cased)
        expect(subject.lorem_ipsum(words: 8, format: :titlecase)).to eq(title_cased)
      end

      it 'returns upcased text' do
        upcased = 'LOREM IPSUM DOLOR SIT AMET, CONSECTETUER ADIPISCING ELIT.'

        expect(subject.lorem_ipsum(words: 8, format: :uppercase)).to eq(upcased)
        expect(subject.lorem_ipsum(words: 8, format: :upcase)).to eq(upcased)
      end

      it 'returns downcased text' do
        downcased = 'lorem ipsum dolor sit amet, consectetuer adipiscing elit.'

        expect(subject.lorem_ipsum(words: 8, format: :lowercase)).to eq(downcased)
        expect(subject.lorem_ipsum(words: 8, format: :downcase)).to eq(downcased)
      end

    end

    describe '#short' do

      it 'returns a short fragment' do
        short_fragment = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'

        expect(subject.short).to eq(short_fragment)
      end

    end

    describe '#medium' do

      it 'returns a medium long fragment' do
        medium_fragment = [first_paragraph, second_paragraph].join("\n")

        expect(subject.medium).to eq(medium_fragment)
      end

    end

    describe '#long' do

      it 'returns a long fragment' do
        long_fragment = [raw_text, first_paragraph, second_paragraph].join("\n")

        expect(subject.long).to eq(long_fragment)
      end

    end

    describe '#very_long' do

      it 'returns a very long fragment' do
        very_long_fragment = ([raw_text] * 4).join("\n")

        expect(subject.very_long).to eq(very_long_fragment)
      end
    end

  end

  describe '#text' do

    it 'is an alias of #lorem_ipsum' do
      expect(subject.method(:text)).to eq(subject.method(:lorem_ipsum))
    end

  end

  describe '#placeholder_image(:width, :height)' do

    it 'responds to #placeholder_image' do

      expect(subject).to respond_to(:placeholder_image)
    end

  end

  describe '#random(:paragraphs)' do

    it 'returns the given number of paragraphs beginning at a random one' do
      subject.stub(:get_random).and_return(0, 5)
      paragraphs1 = subject.random(paragraphs: 4)
      paragraphs2 = subject.random

      expect(paragraphs1).not_to eq(paragraphs2)
      expect(paragraphs1.length).to be > paragraphs2.size
      expect(paragraphs1.split("\n").size).to eq(4)
      expect(paragraphs2.split("\n").size).to eq(1)
    end
  end

end
