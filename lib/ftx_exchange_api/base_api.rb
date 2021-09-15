# frozen_string_literal: true

require 'httparty'

module FtxExchangeApi
  class BaseApi
    include HTTParty

    attr_reader :config

    def initialize(config: nil)
      @config = Config.new(config)
      @config.reverse_merge!(FtxExchangeApi.default_config)
    end

    protected

    def send_request(method, path, headers, query)
      uuid = SecureRandom.uuid
      print_log(:info, "[API] #{uuid} #{method.upcase} '#{path}' query = #{query}")

      body_or_query = method == :get ? :query : :body

      begin
        response = self.class.send(
          method,
          path,
          headers: headers,
          timeout: @config.timeout,
          body_or_query => query,
        ).parsed_response

        print_log(:info, "[API] #{uuid} response #{response}")
        return response
      rescue => error
        print_log(:error, "[API] #{uuid} raise exception #{error.message}")
        raise error
      end
    end

    private

    def print_log(method, message)
      logger = @config.logger
      logger.send(method, message) if logger
    end
  end
end
