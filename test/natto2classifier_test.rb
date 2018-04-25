
require './lib/natto2classifier'
require 'csv'
require 'minitest/autorun'

class Natto2classifierTest < Minitest::Test
  def setup
    @classifier = Natto2classifier::Bayes.new '朝食', '夕食'
  end

  def test_that_it_has_a_version_number
    refute_nil ::Natto2classifier::VERSION
  end

  def test_natto_parse
    word = '今日の朝食は納豆だ'
    check = ['今日 キョウ', 'の ノ', '朝食 チョウショク', 'は ハ', '納豆 ナットウ', 'だ ダ']
    assert_equal Natto2classifier::Natto.parse(word), check
  end

  def test_classify
    CSV.foreach('./data/train.csv') do |row|
      @classifier.train row[0], row[1]
    end
    assert_equal @classifier.classify('納豆は朝食だよ'), '朝食'
    assert_equal @classifier.classify('鍋料理'), '夕食'
  end
end
