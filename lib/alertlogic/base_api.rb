require 'net/https'
require 'uri'
require 'multi_json'
require 'alertlogic/exception'

module Alertlogic

  # Generic API class for Alertlogic, inherit from this class
  # to create API classes for different services
  class BaseApi

    def initialize(options={}, defaults={})
      @defaults = defaults
      @options = options
    end

    def get(path, params={})
      params = @defaults.merge(params)

      request = Net::HTTP::Get.new(path)
      request.body = MultiJson.encode(params)

      response = http_connection.start { |h| h.request(add_required_headers(request)) }

      handle_response(response)
    end

    def post(path, params={})
      params = @defaults.merge(params)

      request = Net::HTTP::Post.new(path)
      request.body = MultiJson.encode(params)

      response = http_connection.start { |h| h.request(add_required_headers(request)) }

      handle_response(response)
    end

    def put(path, params={})
      params = @defaults.merge(params)

      request = Net::HTTP::Put.new(path)
      request.body = MultiJson.encode(params)

      response = http_connection.start { |h| h.request(add_required_headers(request)) }

      handle_response(response)
    end

    def delete(path, params={})
      params = @defaults.merge(params)

      request = Net::HTTP::Delete.new(path)
      request.body = MultiJson.encode(params)

      response = http_connection.start { |h| h.request(add_required_headers(request)) }

      handle_response(response)
    end

    def handle_response(response)
      json = if response.body.present?
               MultiJson.decode(response.body)
             else
               {}
             end

      if %q(200, 201).include?(response.code)
        json
      else
        handle_error(response.code, json)
      end
    end


    def handle_error(status, response)
      case status
        when '500'
          raise Alertlogic::ServerError.new(500, response['error'])
        when '401'
          raise Alertlogic::Unauthorized.new(401, response['error'])
        when '403'
          raise Alertlogic::Forbidden.new(403, response['error'])
        when '406'
          raise Alertlogic::NotAcceptable.new(406, response['error'])
        when '409'
          raise Alertlogic::Conflict.new(406, response['error'])
        when '422'
          raise Alertlogic::UnprocessableEntity.new(422, response['error'])
        when '404'
          raise Alertlogic::NotFound.new(404, response['error'])
        when '400'
          raise Alertlogic::BadRequest.new(400, response['error'])
        else
          raise Alertlogic::UnknownError.new(status.to_i, response['error'])
      end
    end

    private
    def add_required_headers(request)
      request['Content-Type'] = 'application/json'
      request['Accept'] = 'application/json'
      request['X-Client-Cert-Dn'] = @options[:client_certificate_dn]
      request
    end

    def http_connection
      http = Net::HTTP.new(@options[:base_url], @options[:port])

      if @options[:scheme] == 'https' # enable SSL/TLS
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
      http
    end
  end
end