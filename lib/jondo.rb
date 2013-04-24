require File.expand_path('../jondo/error', __FILE__)
require File.expand_path('../jondo/configuration', __FILE__)
require File.expand_path('../jondo/api', __FILE__)
require File.expand_path('../jondo/client', __FILE__)

module Jondo
  extend Configuration

  # Alias for Jondo::Client.new
  #
  # @return [Jondo::Client]
  def self.client(options={})
    Jondo::Client.new(options)
  end

  # Delegate to Jondo::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Jondo::Client
  def self.respond_to?(method)
    return client.respond_to?(method) || super
  end
end