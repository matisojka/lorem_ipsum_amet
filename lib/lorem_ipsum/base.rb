module LoremIpsumAmet
  class Base

    class << self

      def lorem_ipsum(characters = nil)
        if characters.nil?
          paragraphs.first
        else
          lorem_ipsum_characters(characters)
        end
      end

      alias text lorem_ipsum

      def full
        raw_text
      end

      private

      def raw_text
        Text.raw
      end

      def paragraphs
        raw_text.split("\n")
      end

      def lorem_ipsum_characters(characters)
        times_to_repeat = (characters / raw_text.length) + 1

        text = ([raw_text] * times_to_repeat).join("\n")

        text[0..characters]
      end

    end

  end
end
