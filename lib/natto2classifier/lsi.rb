
module Natto2classifier
  # It is a library that classifies Japanese language.
  class LSI < ClassifierReborn::LSI
    alias_method :__add_item__, :add_item
    alias_method :__classify__, :classify
    alias_method :__find_related__, :find_related
    private :__add_item__, :__classify__, :__find_related__

    def add_item(word, category)
      __add_item__ Natto2classifier::Natto.parse(word).join(' '), category
    end

    def classify(word)
      __classify__ Natto2classifier::Natto.parse(word).join(' ')
    end

    def find_related(word)
      __find_related__ Natto2classifier::Natto.parse(word).join(' ')
    end
  end
end
