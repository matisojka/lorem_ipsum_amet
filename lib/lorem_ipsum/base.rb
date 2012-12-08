module LoremIpsumAmet
  class Base

    # cp: character or paragraphs
    def lorem_ipsum(cp = nil, options = {})
      cp = { characters: cp } unless cp.respond_to?(:merge)
      @cp = cp.merge!(options)

      join_element = cp[:join].nil? && cp.delete(:html) ? '<br />' : cp.delete(:join)

      if cp[:characters]
        Character.new(self, cp.delete(:characters), join_element).text
      elsif cp[:paragraphs]
        Paragraph.new(self, cp.delete(:paragraphs), join_element).text
      elsif cp[:words]
        Word.new(self, cp.delete(:words), join_element).text
      else
        paragraphs.first
      end
    end

    alias text lorem_ipsum

    def paragraphs
      formatted_text.split("\n")
    end

    private

    def formatted_text
      case @cp[:format]
      when :title_case
        raw_text.gsub(/\w+/) { |word| word.capitalize }
      else
        raw_text
      end
    end

    def raw_text
      Text.raw
    end

  end
end
