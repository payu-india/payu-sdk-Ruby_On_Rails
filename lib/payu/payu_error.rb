module PayU
  class PayuError < StandardError
    def initialize(msg="PayuError", exception_type="Standard")
      @exception_type = exception_type
      super(msg)
    end
  end
end