# Natto2classifier

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/natto2classifier`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'natto2classifier'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install natto2classifier

## Usage

### Baysian methods

```
bayes = Natto2classifier::Bayes.new '朝食', '夕食'
bayes.train '朝食', '今日の朝食は納豆だ'
bayes.train '夕食', '今日の夕食は湯豆腐だ'
bayes.classify '納豆はいつも朝食べている' #=> '朝食'
```

### LSI methods

```
lsi = Natto2classifier::LSI.new
lsi.add_item '今日の朝食は納豆だ', '朝食'
lsi.add_item '今日の夕食は湯豆腐だ', '夕食'
lsi.classify '納豆はいつも朝食べている' #=> '朝食'
lsi.find_related '納豆はいつも朝食べている' #=> ['今日 キョウ の ノ 朝食 チョウショク は ハ 納豆 ナットウ だ ダ', '今日 キョウ の ノ 夕食 ユウショク は ハ 湯豆腐 ユドウフ だ ダ']
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/natto2classifier. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Natto2classifier project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/natto2classifier/blob/master/CODE_OF_CONDUCT.md).
