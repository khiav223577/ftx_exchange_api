# ftx_exchange_api

[![Gem Version](https://img.shields.io/gem/v/ftx_exchange_api.svg?style=flat)](http://rubygems.org/gems/ftx_exchange_api)
[![Build Status](https://github.com/khiav223577/ftx_exchange_api/workflows/Ruby/badge.svg)](https://github.com/khiav223577/ftx_exchange_api/actions)
[![RubyGems](http://img.shields.io/gem/dt/ftx_exchange_api.svg?style=flat)](http://rubygems.org/gems/ftx_exchange_api)
[![Code Climate](https://codeclimate.com/github/khiav223577/ftx_exchange_api/badges/gpa.svg)](https://codeclimate.com/github/khiav223577/ftx_exchange_api)
[![Test Coverage](https://codeclimate.com/github/khiav223577/ftx_exchange_api/badges/coverage.svg)](https://codeclimate.com/github/khiav223577/ftx_exchange_api/coverage)

## Supports
- Ruby 2.2 ~ 2.7

## Installation

```ruby
gem 'ftx_exchange_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ftx_exchange_api

## Configuration

### Set timeout time

```rb
# default config
FtxExchangeApi.default_config.timeout = 3 # seconds

# custom config
FtxExchangeApi::PublicApi.new(config: { timeout: 12 })
FtxExchangeApi::PrivateApi.new(access_key, secret_key, config: { timeout: 12 })
```

### Logging

```rb
require 'logger'

# default config
FtxExchangeApi.default_config.logger = Logger.new(STDOUT) # print log to stdand output
FtxExchangeApi.default_config.logger = Logger.new('log/api.log')

# custom config
FtxExchangeApi::PublicApi.new(config: { logger: Logger.new(STDOUT) })
FtxExchangeApi::PrivateApi.new(access_key, secret_key, config: { logger: Logger.new(STDOUT) })
```

## Usage

### Public Api Examples

```rb
@api = FtxExchangeApi::PublicApi.new
```

#### [GET /markets](https://docs.ftx.com/?ruby#get-markets)

> Get markets

<details>
  <summary>Show code</summary>

```rb
@api.markets
```
</details>

#### [GET /markets/{market_name}](https://docs.ftx.com/?ruby#get-markets)

> Get single market

<details>
  <summary>Show code</summary>

```rb
@api.markets(market_name)
```
</details>

#### [GET /markets/{market_name}/orderbook?depth={depth}](https://docs.ftx.com/?ruby#get-markets)

> Get orderbook

<details>
  <summary>Show code</summary>

```rb
# use default parameters
@api.orderbook(market_name)

# provide all possible parameters
@api.orderbook(market_name, depth: 3)
```
</details>

### Private Api Examples

```rb
access_key = 'YOUR_ACCESS_KEY'
secret_key = 'YOUR_SECRET_KEY'

@api = FtxExchangeApi::PrivateApi.new(access_key, secret_key)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/khiav223577/ftx_exchange_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

