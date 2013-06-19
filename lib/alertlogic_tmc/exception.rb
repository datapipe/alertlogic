module AlertlogicTmc
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

  class ServerError < AlertlogicTmc::Exception
  end

  class Forbidden < AlertlogicTmc::Exception
  end

  class Forbidden < AlertlogicTmc::Exception
  end

  class Conflict < AlertlogicTmc::Exception
  end

  class NotAcceptable < AlertlogicTmc::Exception
  end

  class UnprocessableEntity < AlertlogicTmc::Exception
  end

  class NotFound < AlertlogicTmc::Exception
  end

  class ConnectionException < AlertlogicTmc::Exception
  end

  class Unauthorized < AlertlogicTmc::Exception
  end

  class BadRequest < AlertlogicTmc::Exception
  end

  class UnknownError < AlertlogicTmc::Exception
  end
end