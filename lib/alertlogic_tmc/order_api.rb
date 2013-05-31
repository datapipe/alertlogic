require 'alertlogic_tmc/base_api'

module AlertlogicTmc
  class OrderApi < AlertlogicTmc::BaseApi
    def find(id)
      get("/api/order/v2/#{id}")
    end

    def create(options={})
      post('/api/order/v2', options)
    end
  end
end
