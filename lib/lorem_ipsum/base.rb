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
          Paragraph.new(self, cp[:paragraphs], join_element).text
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
        Character.new(self, characters, join_element).text
      end

    end

  end
end
