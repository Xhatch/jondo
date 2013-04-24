require "jondo/api_client/version"

module Jondo

  ##
  # This class manages APIs communication.
  class APIClient
    ##
    # Creates a new Jondo API client.
    #
    # @param [Hash] options The configuration parameters for the client.
    # @option options [Boolean] :auto_refresh_token (true)
    #   Some desc of option
    def initialize(options={})
      logger.debug { "#{self.class} - Initializing client with options #{options}" }
      @client = Jondo::APIClient.new(options) unless defined?(@client) && @client.hash == options.hash
      logger.debug("MADE NEW CLIENT!!")
      @client
    end

    def respond_to_missing?(method_name, include_private=false); client.respond_to?(method_name, include_private); end if RUBY_VERSION >= "1.9"
    def respond_to?(method_name, include_private=false); client.respond_to?(method_name, include_private) || super; end if RUBY_VERSION < "1.9"

  private

    def self.method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end

  end
end
