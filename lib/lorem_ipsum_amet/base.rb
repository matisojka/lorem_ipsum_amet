module LoremIpsumAmet
  class Base
    class << self
      include Image

      def params
        @params ||= {}
      end

      # cpw: characters, paragraphs or words
      def lorem_ipsum(cpw = nil, options = {})
        cpw = { characters: cpw } unless cpw.respond_to?(:merge)
        @params = cpw.merge(options)

        if c = params[:characters] || params[:c]
          Character.new(self, c, join_element).text
        elsif p = params[:paragraphs] || params[:p]
          Paragraph.new(self, p, join_element).text
        elsif w = params[:words] || params[:w]
          Word.new(self, w, join_element).text
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
        _paragraphs = options[:paragraphs] || 1
        Paragraph.new(self, _paragraphs, options[:join_element]).random
      end

      private

      def join_element
        params[:join].nil? && params[:html] ? '<br />' : params[:join]
      end

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
end
