
require 'natto'

module Natto2classifier
  class Natto
    def self.parse(word)
      raise 'input word is not exist.' unless word.is_a?(String)

      nm = ::Natto::MeCab.new('-F%m')
      results = []
      nm.enum_parse(word).each{|n| results << n.feature if !n.is_eos? }
      results
    end
  end
end
