require 'alertlogic_tmc/base_api'

module AlertlogicTmc
  class ProtectedHostApi < AlertlogicTmc::BaseApi
    def find(id)
      get("/api/tm/v1/protectedhosts/#{id}")
    end

    def list(options={})
      get("/api/tm/v1/protectedhosts", options)
    end

    def update(id, options={})
      post("/api/tm/v1/protectedhosts/#{id}", options)
    end

  end
end