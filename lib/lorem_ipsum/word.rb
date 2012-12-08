module LoremIpsumAmet
  class Word

    def initialize(base, words, join_element)
      @base = base
      @words = words
      @join_element = join_element
    end

    def text
      joined_text.gsub(/\s+\$JOIN\s+/, join_element)
    end

    private

    def join_element
      @join_element ||= "\n"
    end

    def base_text
      # Using a trick here: putting the string $JOIN to keep the
      # reference to the paragraphs, which in case of \n would get
      # lost when #split would get called
      @base.paragraphs.join(' $JOIN ')
    end

    def times_to_repeat
      (@words / base_text.split.size) + 1
    end

    def joined_text
      text = ([base_text] * times_to_repeat).join(' $JOIN ')
      joins = text.split[0...@words].select { |word| word == '$JOIN' }.size

      words_without_joins = @words + joins
      text.split[0...words_without_joins].join(' ')
    end

  end
end

