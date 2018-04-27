
module Natto2classifier
  # It is a library that classifies Japanese language.
  class Bayes < ClassifierReborn::Bayes
    alias_method :__train__, :train
    alias_method :__classify__, :classify
    private :__train__, :__classify__

    def train(category, word)
      __train__ category, Natto2classifier::Natto.parse(word).join(' ')
    end

    def classify(word)
      __classify__ Natto2classifier::Natto.parse(word).join(' ')
    end
  end
end
