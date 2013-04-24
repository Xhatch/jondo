module Jondo
  class Client
    # Defines methods related to placing an order
    module Orders

      def order(*args)
        response = post("cofApi.php")
        response["data"]
      end

    end
  end
end
