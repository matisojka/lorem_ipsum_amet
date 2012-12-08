module LoremIpsumAmet
  class Base

    class << self

      # cp: character or paragraphs
      def lorem_ipsum(cp = nil)
        if cp.is_a? Fixnum
          lorem_ipsum_characters(cp)
        elsif cp.is_a?(Hash) && cp.has_key?(:paragraphs)
          join_element = if cp[:join].nil? && cp[:html]
                           '<br />'
                         else
                           cp[:join]
                         end

          lorem_ipsum_paragraphs(cp[:paragraphs], join_element)
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

      def lorem_ipsum_paragraphs(paragraphs, join_element = "\n")
        join_element = "\n" if join_element.nil?
        times_to_repeat = (paragraphs / self.paragraphs.size) + 1

        ([self.paragraphs] * times_to_repeat).flatten[0...paragraphs].join(join_element)
      end

    end

  end
end
