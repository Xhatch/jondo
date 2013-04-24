module Jondo
  # Wrapper for the Jondo API
  #
  # @note All methods have been separated into modules and follow the same grouping used in {TODO:doc_URL the Jondo API Documentation}.
  # @see TODO:doc_url
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include Jondo::Client::Utils

    include Jondo::Client::Users
  end
end