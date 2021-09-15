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

def assert_success_response(response)
  assert_equal %w[success result], response.keys
  assert_equal true, response['success']
end

def assert_hash_to_include(expected_data, data)
  assert_instance_of Hash, data
  assert_equal expected_data, expected_data.keys.map{|k| [k, data[k]] }.to_h
end

FtxExchangeApi.default_config.timeout = 15
