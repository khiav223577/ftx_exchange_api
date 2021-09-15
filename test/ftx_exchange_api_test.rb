require 'test_helper'

class FtxExchangeApiTest < Minitest::Test
  def setup
  end

  def test_that_it_has_a_version_number
    refute_nil ::FtxExchangeApi::VERSION
  end
end
