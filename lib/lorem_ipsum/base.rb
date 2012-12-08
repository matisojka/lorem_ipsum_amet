module LoremIpsumAmet
  class Base

    # cpw: characters, paragraphs or words
    def lorem_ipsum(cpw = nil, options = {})
      cpw = { characters: cpw } unless cpw.respond_to?(:merge)
      @params = cpw.merge!(options)

      join_element = @params[:join].nil? && @params.delete(:html) ? '<br />' : @params.delete(:join)

      if @params[:characters]
        Character.new(self, @params.delete(:characters), join_element).text
      elsif @params[:paragraphs]
        Paragraph.new(self, @params.delete(:paragraphs), join_element).text
      elsif @params[:words]
        Word.new(self, @params.delete(:words), join_element).text
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
      case @params[:format]
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
