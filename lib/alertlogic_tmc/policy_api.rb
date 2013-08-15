require 'alertlogic_tmc/base_api'

module AlertlogicTmc
  class PolicyApi < AlertlogicTmc::BaseApi
    def find(id)
      get("/api/tm/v1/policies/#{id}")
    end

    def list
      get("/api/tm/v1/policies")
    end

    def create(options={})
      post("/api/tm/v1/policies", options)
    end

    def update(id, options={})
      post("/api/tm/v1/policies/#{id}", options)
    end

    def destroy(id)
      delete("/api/tm/v1/policies/#{id}")
    end
  end
end