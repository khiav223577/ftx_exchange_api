require 'test_helper'

class PublicApiTest < Minitest::Test
  def setup
    @api = FtxExchangeApi::PublicApi.new
  end

  def test_markets
    response = @api.stub(:print_log, nil) do
      @api.markets
    end

    assert_equal %w[success result], response.keys
    assert_instance_of(Array, response['result'])

    yfi_market = response['result'].select{|s| s['name'] == 'YFI/USDT' }[0]
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
    assert_equal expected_data, yfi_market.slice(*expected_data.keys)
  end
end

