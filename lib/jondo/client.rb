module Jondo
  # Wrapper for the Jondo API
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include Jondo::Client::Orders
    include Jondo::Client::Quotes
  end
end
