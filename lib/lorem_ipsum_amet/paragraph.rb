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

    def random
      random_joined_text
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

    def random_joined_text
      random = get_random(all_paragraphs.size)
      ([all_paragraphs] * (times_to_repeat + 1)).flatten[random...@paragraphs + random].join(join_element)
    end

    def get_random(size)
      rand(size)
    end

    def joined_text
      ([all_paragraphs] * times_to_repeat).flatten[0...@paragraphs].join(join_element)
    end

    def all_paragraphs
      @base.paragraphs
    end

  end
end

