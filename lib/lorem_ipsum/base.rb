module LoremIpsumAmet
  class Base

    def params
      @params ||= {}
    end

    # cpw: characters, paragraphs or words
    def lorem_ipsum(cpw = nil, options = {})
      cpw = { characters: cpw } unless cpw.respond_to?(:merge)
      @params = cpw.merge!(options)

      join_element = params[:join].nil? && params.delete(:html) ? '<br />' : params.delete(:join)

      if params[:characters]
        Character.new(self, params.delete(:characters), join_element).text
      elsif params[:paragraphs]
        Paragraph.new(self, params.delete(:paragraphs), join_element).text
      elsif params[:words]
        Word.new(self, params.delete(:words), join_element).text
      else
        paragraphs.first
      end
    end

    alias text lorem_ipsum

    def paragraphs
      formatted_text.split("\n")
    end

    def short
      Word.new(self, 8, nil).text
    end

    def medium(join_element = "\n")
      Paragraph.new(self, 2, join_element).text
    end

    def long(join_element = "\n")
      Paragraph.new(self, 8, join_element).text
    end

    def very_long(join_element = "\n")
      Paragraph.new(self, 24, join_element).text
    end

    # http://goo.gl/m0MMz ;)
    def the_lord_of_the_rings_long(join_element = "\n")
      Word.new(self, 500000, join_element).text
    end

    private

    def formatted_text
      case params[:format]
      when :title_case, :titlecase
        raw_text.gsub(/\w+/) { |word| word.capitalize }
      when :upcase, :uppercase
        raw_text.upcase
      when :downcase, :lowercase
        raw_text.downcase
      else
        raw_text
      end
    end

    def raw_text
      Text.raw
    end

  end
end
