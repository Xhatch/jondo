require 'faraday_middleware'
Dir[File.expand_path('../faraday/*.rb', __FILE__)].each{|f| require f}

module Jondo
  # @private
  module Connection
    private

    def connection(raw=false)
      options = {
        :headers => {'Accept' => "application/#{format}; charset=utf-8", 'User-Agent' => user_agent, 'Content-Type' => "application/#{format}"},
        :proxy => proxy,
        :ssl => {:verify => false},
        :url => endpoint,
      }

      Faraday::Connection.new(options) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.adapter(adapter)
        connection.use FaradayMiddleware::Mashify unless raw
        unless raw
          case format.to_s.downcase
          when 'json' then connection.use Faraday::Response::ParseJson
          when 'xml'  then connection.use Faraday::Response::ParseXml
          end
        end
        connection.use FaradayMiddleware::JondoRaiseHttpException
      end
    end
  end
end
