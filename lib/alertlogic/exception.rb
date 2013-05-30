module Alertlogic
  class Exception < ::StandardError
    attr_accessor :status
    attr_accessor :error

    def initialize(status, error)
      self.status = status
      self.error = error
    end

    def to_s
      message
    end

    def message
      error
    end

  end

  class ServerError < Alertlogic::Exception
  end

  class Forbidden < Alertlogic::Exception
  end

  class Forbidden < Alertlogic::Exception
  end

  class Conflict < Alertlogic::Exception
  end

  class NotAcceptable < Alertlogic::Exception
  end

  class UnprocessableEntity < Alertlogic::Exception
  end

  class NotFound < Alertlogic::Exception
  end

  class ConnectionException < Alertlogic::Exception
  end

  class Unauthorized < Alertlogic::Exception
  end

  class BadRequest < Alertlogic::Exception
  end

  class UnknownError < Alertlogic::Exception
  end
end