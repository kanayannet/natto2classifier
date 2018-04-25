require 'natto2classifier/version'
require 'natto2classifier/natto'
require 'classifier-reborn'

module Natto2classifier
  # It is a library that classifies Japanese language.
  class Bayes < ClassifierReborn::Bayes
    def train(category, word)
      super category, Natto2classifier::Natto.parse(word).join(' ')
    end

    def classify(word)
      super Natto2classifier::Natto.parse(word).join(' ')
    end
  end
end
