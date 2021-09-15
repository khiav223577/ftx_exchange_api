require 'test_helper'

class PublicApiTest < Minitest::Test
  def setup
    @api = FtxExchangeApi::PublicApi.new
  end

  def test_markets
    response = @api.stub(:print_log, nil) do
      @api.markets
    end

    assert_success_response(response)
    assert_instance_of Array, response['result']

    yfi_market = response['result'].find{|s| s['name'] == 'YFI/USDT' }
    expected_data = {
      'name'                  => 'YFI/USDT',
      'enabled'               => true,
      'postOnly'              => false,
      'type'                  => 'spot',
      'baseCurrency'          => 'YFI',
      'quoteCurrency'         => 'USDT',
      'underlying'            => nil,
      'restricted'            => false,
      'highLeverageFeeExempt' => true,
    }
    assert_hash_to_include expected_data, yfi_market
  end

  def test_single_market
    response = @api.stub(:print_log, nil) do
      @api.markets('YFI/USDT')
    end

    assert_success_response(response)
    assert_instance_of Hash, response['result']

    expected_data = {
      'name'                  => 'YFI/USDT',
      'enabled'               => true,
      'postOnly'              => false,
      'type'                  => 'spot',
      'baseCurrency'          => 'YFI',
      'quoteCurrency'         => 'USDT',
      'underlying'            => nil,
      'restricted'            => false,
      'highLeverageFeeExempt' => true,
    }
    assert_hash_to_include expected_data, response['result']
  end

  def test_orderbook
    response = @api.stub(:print_log, nil) do
      @api.orderbook('YFI/USDT', depth: 3)
    end

    assert_success_response(response)
    assert_instance_of Hash, response['result']

    assert_equal %w[bids asks], response['result'].keys
    assert_instance_of Array, response['result']['bids']
    assert_instance_of Array, response['result']['asks']
    assert_equal 3, response['result']['bids'].size
    assert_equal 3, response['result']['asks'].size
  end
end
