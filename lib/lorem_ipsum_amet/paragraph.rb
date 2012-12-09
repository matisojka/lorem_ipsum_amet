module LoremIpsumAmet
  class Paragraph

    def initialize(base, paragraphs, join_element)
      @base = base
      @paragraphs = paragraphs
      @join_element = join_element
    end

    def text
      joined_text
    end

    private

    def join_element
      @join_element ||= "\n"
    end

    def base_text
      @base.paragraphs.join(join_element)
    end

    def times_to_repeat
      (@paragraphs / @base.paragraphs.size) + 1
    end

    def joined_text
      ([@base.paragraphs] * times_to_repeat).flatten[0...@paragraphs].join(join_element)
    end

  end
end

