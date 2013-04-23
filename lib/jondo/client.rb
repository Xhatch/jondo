module Jondo
  # Wrapper for the Jondo REST API
  #
  # @see TODO:doc_url
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

  end
end