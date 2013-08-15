require 'alertlogic_tmc/base_api'

module AlertlogicTmc
  class ApplianceApi < AlertlogicTmc::BaseApi
    def find(id)
      get("/api/tm/v1/appliances/#{id}")
    end

    def list(options={})
      get("/api/tm/v1/appliances", options)
    end

    def update(id, options={})
      post("/api/tm/v1/appliances/#{id}", options)
    end
  end
end
