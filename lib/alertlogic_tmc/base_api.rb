module AlertlogicTmc

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
          raise AlertlogicTmc::ServerError.new(500, response)
        when '401'
          raise AlertlogicTmc::Unauthorized.new(401, response)
        when '403'
          raise AlertlogicTmc::Forbidden.new(403, response)
        when '406'
          raise AlertlogicTmc::NotAcceptable.new(406, response)
        when '409'
          raise AlertlogicTmc::Conflict.new(406, response)
        when '422'
          raise AlertlogicTmc::UnprocessableEntity.new(422, response)
        when '404'
          raise AlertlogicTmc::NotFound.new(404, response)
        when '400'
          raise AlertlogicTmc::BadRequest.new(400, response)
        else
          raise AlertlogicTmc::UnknownError.new(status.to_i, response)
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