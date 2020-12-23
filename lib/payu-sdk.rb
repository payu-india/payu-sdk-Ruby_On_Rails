require 'payu/constants'
require 'payu/payu_error';
require 'payu/validator'
require 'payu/hasher'

# Base module
module PayU
  class << self
    attr_accessor :key, :salt
  end

  def self.init(key, salt)
    self.key = key
    self.salt = salt
  end

end
