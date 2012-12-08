module LoremIpsumAmet
  class Base

    class << self

      def lorem_ipsum
        paragraphs.first
      end

      alias text lorem_ipsum

      private

      def raw_text
        Text.raw
      end

      def paragraphs
        raw_text.split("\n")
      end

    end

  end
end
