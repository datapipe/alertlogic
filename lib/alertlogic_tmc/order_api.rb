require 'alertlogic_tmc/base_api'

module AlertlogicTmc
  class OrderApi < AlertlogicTmc::BaseApi
    def find(id)
      get("/api/order/v2/#{id}")
    end

    def create(options={})
      post('/api/order/v2', options)
    end

    protected

    def add_required_headers(request)
      request['Content-Type'] = 'application/json'
      request['Accept'] = 'application/json'
      request['X-Client-Cert-Dn'] = self.options[:client_certificate_dn]
      request
    end

    def http_connection
      http = Net::HTTP.new(@options[:base_url], @options[:port])

      if @options[:scheme] == 'https' # enable SSL/TLS
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        pem = File.read(@options[:ca_file])
        http.cert = OpenSSL::X509::Certificate.new(pem)
        http.key = OpenSSL::PKey::RSA.new(pem)
      end
      http
    end
  end
end
