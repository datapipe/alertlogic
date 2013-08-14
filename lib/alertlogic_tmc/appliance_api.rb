require 'alertlogic_tmc/base_api'

module AlertlogicTmc
  class ApplianceApi < AlertlogicTmc::BaseApi
    def find(id)
      get("/api/tm/v1/appliances/#{id}")
    end

    def list
      get("/api/tm/v1/appliances")
    end

    def update(options={})
      post("/api/tm/v1/appliances/#{id}", options)
    end
  end
end
