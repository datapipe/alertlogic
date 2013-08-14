require 'alertlogic_tmc/base_api'

module AlertlogicTmc
  class ProtectedHostApi < AlertlogicTmc::BaseApi
    def find(id)
      get("/api/tm/v1/protectedhosts/#{id}")
    end

    def list
      get("/api/tm/v1/protectedhosts")
    end

    def update(options={})
      post("/api/tm/v1/protectedhosts/#{id}", options)
    end

  end
end