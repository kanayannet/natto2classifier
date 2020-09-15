
require 'natto'

module Natto2classifier
  class Natto
    def self.parse(word)
      nm = ::Natto::MeCab.new
      results = []
      nm.parse(word.to_s) do |n|
        break if n.is_eos?
        kana = n.feature.split(',')[7]
        results << n.surface
        results << kana if !kana.nil? && kana != '*'
      end
      results
    end
  end
end
