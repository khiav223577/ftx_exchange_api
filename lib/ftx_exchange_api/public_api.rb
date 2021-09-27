# frozen_string_literal: true

require 'ftx_exchange_api/base_api'

module FtxExchangeApi
  class PublicApi < BaseApi
    base_uri 'https://ftx.com/api'

    def markets(market_name = nil)
      if market_name
        send_request(:get, "/markets/#{market_name}", {})
      else
        send_request(:get, '/markets', {})
      end
    end

    def orderbook(market_name, depth: nil)
      send_request(:get, "/markets/#{market_name}/orderbook", depth: depth)
    end

    protected

    def send_request(method, path, query)
      super(method, path, {}, query.reject{|_k, v| v == nil })
    end
  end
end
