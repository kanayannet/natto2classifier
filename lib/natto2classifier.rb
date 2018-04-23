require 'natto2classifier/version'
require 'natto2classifier/natto'
require 'classifier-reborn'

module Natto2classifier
  # It is a library that classifies Japanese language.
  class Bayes
    def initialize(*category)
      raise 'category is not exists' if category.nil?
      raise 'category is not array' unless category.is_a?(Array)
      @bayes = ClassifierReborn::Bayes.new(*category)
    end

    def train(category, word)
      @bayes.train category, Natto2classifier::Natto.parse(word).join(' ')
    end

    def classify(word)
      @bayes.classify word
    end
  end
end
