module Jondo
  class Client
    # Defines methods related to getting a quote
    module Quotes

      def quote(*args)
        args ||= { xml: "<root><quoteRequest><userId>66</userId><apiKey>jh6Rfs49v</apiKey><refNumber>Test1304468909</refNumber><address>1000 Universal City Dr.</address><city>UNIVERSAL CITY</city><state>CA</state><zip>91608</zip><country>US</country><quoteItems><quoteItem><qt>1</qt><code>8001</code></quoteItem><quoteItem><qt>2</qt><code>8044</code></quoteItem><quoteItem><qt>1</qt><code>8086</code></quoteItem></quoteItems></quoteRequest></root>"}
        response = post("api/quoteApi.php", args, true, true)
        parsed = MultiXml.parse(response.body)
        root = parsed["root"]
        reply = root["quoteReply"] unless root.nil?
        reply
      end

    end
  end
end
