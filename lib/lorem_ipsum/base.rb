module LoremIpsumAmet
  class Base

    class << self

      def lorem_ipsum(characters_or_paragraphs = nil)
        if characters_or_paragraphs.is_a? Fixnum
          lorem_ipsum_characters(characters_or_paragraphs)
        elsif characters_or_paragraphs.is_a?(Hash) && characters_or_paragraphs.has_key?(:paragraphs)
          lorem_ipsum_paragraphs(characters_or_paragraphs[:paragraphs])
        else
          paragraphs.first
        end
      end

      alias text lorem_ipsum

      def full
        raw_text
      end

      def paragraphs
        raw_text.split("\n")
      end

      private

      def raw_text
        Text.raw
      end

      def lorem_ipsum_characters(characters)
        times_to_repeat = (characters / raw_text.length) + 1

        text = ([raw_text] * times_to_repeat).join("\n")

        text[0..characters]
      end

      def lorem_ipsum_paragraphs(paragraphs)
        times_to_repeat = (paragraphs / self.paragraphs.size) + 1

        ([self.paragraphs] * times_to_repeat).flatten[0...paragraphs].join("\n")
      end

    end

  end
end
