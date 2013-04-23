require "jondo/version"

module Jondo
  class << self
    # Alias for Jondo::Client.new
    #
    # @return [Jondo::Client]
    def client
      @client = Jondo::Client.new(options) unless defined?(@client) && @client.hash == options.hash
      @client.name = "dinjas was here!"
      @client
    end

    def respond_to_missing?(method_name, include_private=false); client.respond_to?(method_name, include_private); end if RUBY_VERSION >= "1.9"
    def respond_to?(method_name, include_private=false); client.respond_to?(method_name, include_private) || super; end if RUBY_VERSION < "1.9"

  private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end

  end
end
