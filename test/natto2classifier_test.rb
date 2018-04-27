
require './lib/natto2classifier'
require 'csv'
require 'minitest/autorun'

class Natto2classifierTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Natto2classifier::VERSION
  end

  def test_natto_parse
    word = '今日の朝食は納豆だ'
    check = ['今日 キョウ', 'の ノ', '朝食 チョウショク', 'は ハ', '納豆 ナットウ', 'だ ダ']
    assert_equal Natto2classifier::Natto.parse(word), check
  end

  def test_bayes_classify
    bayes = Natto2classifier::Bayes.new '朝食', '夕食'
    CSV.foreach('./data/train.csv') do |row|
      bayes.train row[0], row[1]
    end
    assert_equal bayes.classify('納豆は朝食だよ'), '朝食'
    assert_equal bayes.classify('鍋料理'), '夕食'
  end

  def test_lsi_classify
    lsi = Natto2classifier::LSI.new
    CSV.foreach('./data/train.csv') do |row|
      lsi.add_item row[1], row[0]
    end
    assert_equal lsi.classify('納豆は朝食だよ'), '朝食'
    related_str = ['食パン ショクパン は ハ オーソドックス オーソドックス な ナ 朝食 チョウショク だ ダ',
                   '納豆 ナットウ は ハ タンパク質 タンパクシツ が ガ 多い オオイ',
                   'スクランブル スクランブル エッグ エッグ は ハ ホテル ホテル の ノ 朝食 チョウショク で デ よく ヨク 出る デル']
    assert_equal lsi.find_related('納豆は朝食だよ'), related_str

    assert_equal lsi.classify('鍋料理'), '夕食'
    related_str = ['ラーメン ラーメン は ハ 飲ん ノン だ ダ 後 ノチ に ニ 食べる タベル',
                   '納豆 ナットウ は ハ 朝 アサ 食べる タベル と ト 健康 ケンコウ に ニ 良い ヨイ',
                   '鍋 ナベ 料理 リョウリ は ハ みんな ミンナ で デ 囲ん カコン で デ 食べる タベル']
    assert_equal lsi.find_related('鍋料理'), related_str
  end
end
