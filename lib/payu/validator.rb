module PayU
  class Validator
    class << self
      def validate_hash_params(**kwargs)
        kwargs.each do |k, v|
          if not v&.is_a? String
            raise PayU::PayuError.new "#{k} should be of type String"
          end
    
          if kwargs[:txn_id].length > 25
            raise PayU::PayuError.new "txn_id length should be less than equal to 25"
          end
    
          if kwargs[:product_info].length > 100
            raise PayU::PayuError.new "product_info length should be less than equal to 100"
          end
    
          if kwargs[:first_name].length > 60
            raise PayU::PayuError.new "first_name length should be less than equal to 60"
          end
    
          if kwargs[:email].length > 50
            raise PayU::PayuError.new "email length should be less than equal to 50"
          end
    
          if !PayU::EMAIL_REGEX.match(kwargs[:email])
            raise PayU::PayuError.new "Invalid Email"
          end

          if !PayU::AMOUNT_REGEX.match(kwargs[:amount])
            raise PayU::PayuError.new "amount should contain digits with upto 2 decimal places"
          end
          
          [kwargs[:udf1], kwargs[:udf2], kwargs[:udf3], kwargs[:udf4], kwargs[:udf5]].each do |udf|
            if udf.length > 255
              raise PayuError.new "udf length should be less than equal to 255"
            end
          end
        end
      end
    end
  end
end