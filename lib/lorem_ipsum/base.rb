module LoremIpsumAmet
  class Base

    class << self

      # cp: character or paragraphs
      def lorem_ipsum(cp = nil, options = {})
        cp = { characters: cp } unless cp.respond_to?(:merge)
        cp.merge!(options)

        join_element = cp[:join].nil? && cp[:html] ? '<br />' : cp[:join]

        if cp[:characters]
          lorem_ipsum_characters(cp[:characters], join_element)
        elsif cp[:paragraphs]
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

      def lorem_ipsum_characters(characters, join_element = "\n")
        join_element = "\n" if join_element.nil?

        base_text = paragraphs.join(join_element)
        times_to_repeat = (characters / base_text.length) + 1

        text = ([base_text] * times_to_repeat).join(join_element)

        text[0...characters]
      end

      def lorem_ipsum_paragraphs(paragraphs, join_element = "\n")
        join_element = "\n" if join_element.nil?
        times_to_repeat = (paragraphs / self.paragraphs.size) + 1

        ([self.paragraphs] * times_to_repeat).flatten[0...paragraphs].join(join_element)
      end

    end

  end
end
