module PayU
  VERSION = '1.0.0'.freeze
  EMAIL_REGEX = /^(?=.{6,254}$)[A-Za-z0-9_\-\.]{1,64}\@[A-Za-z0-9_\-\.]+\.[A-Za-z]{2,}$/.freeze
  AMOUNT_REGEX = /^\d+(\.\d{1,2})?$/.freeze
end
