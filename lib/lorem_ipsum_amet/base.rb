module LoremIpsumAmet
  class Base
    include Image

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
      elsif params[:c]
        Character.new(self, params.delete(:c), join_element).text
      elsif params[:paragraphs]
        Paragraph.new(self, params.delete(:paragraphs), join_element).text
      elsif params[:p]
        Paragraph.new(self, params.delete(:p), join_element).text
      elsif params[:words]
        Word.new(self, params.delete(:words), join_element).text
      elsif params[:w]
        Word.new(self, params.delete(:w), join_element).text
      else
        paragraphs.first
      end
    end

    alias text lorem_ipsum

    def paragraphs
      formatted_text.split("\n")
    end

    def short
      lorem_ipsum(words: 8)
    end

    def medium(join_element = "\n")
      lorem_ipsum(paragraphs: 2, join: join_element)
    end

    def long(join_element = "\n")
      lorem_ipsum(paragraphs: 8, join: join_element)
    end

    def very_long(join_element = "\n")
      lorem_ipsum(paragraphs: 24, join: join_element)
    end

    # http://goo.gl/m0MMz ;)
    def the_lord_of_the_rings_long(join_element = "\n")
      lorem_ipsum(words: 500000, join: join_element)
    end

    def c(characters, join_element = "\n")
      lorem_ipsum(characters, join: join_element)
    end

    def p(paragraphs, join_element = "\n")
      lorem_ipsum(paragraphs: paragraphs, join: join_element)
    end

    def w(words, join_element = "\n")
      lorem_ipsum(words: words, join: join_element)
    end

    def random(options = {})
      _paragraphs = options.delete(:paragraphs) || 1
      Paragraph.new(self, _paragraphs, options[:join_element]).random
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
