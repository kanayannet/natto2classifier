
require './lib/natto2classifier'
require 'csv'
require 'minitest/autorun'

class Natto2classifierTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Natto2classifier::VERSION
  end

  def test_natto_parse
    word = '今日の朝食は納豆だ'
    check = ['今日','の','朝食','は','納豆','だ']
    assert_equal Natto2classifier::Natto.parse(word), check
  end

  def test_simple_classify
    classifier = Natto2classifier::Bayes.new '朝食', '夕食'
    classifier.train '朝食', '今日の朝食は納豆だ'
    classifier.train '夕食', '今日の夕食は湯豆腐だ'
    assert_equal classifier.classify('納豆はいつも朝食べている'), '朝食'
  end

  def test_long_classify
    classifier = Natto2classifier::Bayes.new '朝食', '夕食'
    CSV.foreach('./data/train.csv') do |row|
      classifier.train row[0], row[1]
    end
    assert_equal classifier.classify('納豆は朝食だよ'), '朝食'
  end
end
