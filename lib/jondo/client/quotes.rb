module Jondo
  class Client
    # Defines methods related to getting a quote
    module Quotes

      def quote(*args)
        response = post("quoteApi.php", )
        response["data"]
      end

    end
  end
end
