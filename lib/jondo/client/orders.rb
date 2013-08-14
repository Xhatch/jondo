module Jondo
  class Client
    # Defines methods related to placing an order
    module Orders

      def order(xml)
        response = post "cofApi.php", xml, true, true
        parsed = MultiXml.parse(response.body)
        root = parsed["root"]
        reply = root["orderReply"] unless root.nil?
        reply
      end

    end
  end
end
