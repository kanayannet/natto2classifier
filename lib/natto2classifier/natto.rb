
require 'natto'

module Natto2classifier
  class Natto
    def self.parse(word)
      nm = ::Natto::MeCab.new('-F%m\s%f[7]')
      results = []
      nm.enum_parse(word.to_s).each do |n|
        results << n.feature if !n.is_eos?
      end
      results
    end
  end
end
