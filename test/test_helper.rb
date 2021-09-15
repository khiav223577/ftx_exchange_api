require 'simplecov'
SimpleCov.start 'test_frameworks'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'ftx_exchange_api'

require 'minitest/color'
require 'minitest/autorun'

module TestHelper
  @origin_default_config = FtxExchangeApi.default_config.clone.freeze

  class << self
    attr_reader :origin_default_config
  end
end

FtxExchangeApi.default_config.timeout = 15
