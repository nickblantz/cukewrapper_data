# CukewrapperData

This plugin allows you to load data using tags

## Installation

Add this to your Gemfile:

```ruby
gem 'cukewrapper'

group :cukewrapper_plugins do
  gem 'cukewrapper_data'
  # ...
end
```

## Usage

`data.source`  and `data.remap` specifies an external ruby file to execute

```gherkin
@cw.data.source=./data/example.json @cw.data.remap=./data/example_remap.rb
Scenario: My scenario
    Given ...
```

### `@cw.data.source`

Specifies a file to load

```json
{
    "foo": "bar"
}
```

### `@cw.data.remap`

Specifies an external ruby file to execute

```ruby
def data_remap(hash)
  hash['foo'] = 'baz'
  hash
end

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nickblantz/cukewrapper_data. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/nickblantz/cukewrapper_data/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CukewrapperData project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/nickblantz/cukewrapper_data/blob/master/CODE_OF_CONDUCT.md).
