module LoremIpsumAmet
  class Character

    def initialize(base, characters, join_element)
      @base = base
      @characters = characters
      @join_element = join_element
    end

    def text
      joined_text[0...@characters]
    end

    private

    def join_element
      @join_element ||= "\n"
    end

    def base_text
      @base.paragraphs.join(join_element)
    end

    def times_to_repeat
      (@characters / base_text.length) + 1
    end

    def joined_text
      ([base_text] * times_to_repeat).join(join_element)
    end

  end
end

