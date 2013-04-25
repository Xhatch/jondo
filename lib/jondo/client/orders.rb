module Jondo
  class Client
    # Defines methods related to placing an order
    module Orders

      def order(*args)
        # args ||= { xml: "<root><orderRequest><userId>66</userId><apiKey>jh6Rfs49v</apiKey><shippingType>priorityMail</shippingType><testMode>1</testMode><quoteId>809</quoteId><poNumber>Test123456</poNumber>www.harvestpro.com 7<firstName>Xml</firstName><lastName>Testing</lastName><address>1000 Universal City Dr.</address><city>UNIVERSAL CITY</city><state>CA</state><zip>91608</zip><country>US</country><phoneNumber>987654321</phoneNumber><orderItems><orderItem><qt>1</qt><code>1234</code><imageLocation>http://www.abc.com/image1.jpg</imageLocation></orderItem><orderItem><qt>1</qt><code>4567</code><imageLocation>http://www.abc.com/image2.jpg</imageLocation></orderItem><orderItem><qt>1</qt><code>4567</code><imageLocation>http://www.abc.com/image3.jpg</imageLocation></orderItem></orderItems></orderRequest></root>"}
        response = post("cofApi.php", args, true, true)
        parsed = MultiXml.parse(response.body)
        root = parsed["root"]
        reply = root["orderReply"] unless root.nil?
        reply
      end

    end
  end
end
