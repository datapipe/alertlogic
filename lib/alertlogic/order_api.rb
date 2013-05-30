module Alertlogic
  class OrderAPI < Alertlogic::API
    def find(id)
      get("/api/order/v2/#{id}")
    end

    def create(options={})
      post('/api/order/v2', options)
    end
  end
end
