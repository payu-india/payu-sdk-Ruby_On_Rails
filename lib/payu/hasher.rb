require 'digest'

module PayU
  class Hasher
    class << self
      def generate_hash(
        txn_id:,
        amount:,
        product_info:,
        first_name:,
        email:,
        udf1: '',
        udf2: '',
        udf3: '',
        udf4: '',
        udf5: '')
        PayU::Validator.validate_hash_params({
          txn_id: txn_id,
          amount: amount,
          product_info: product_info,
          first_name: first_name,
          email: email,
          udf1: udf1,
          udf2: udf2,
          udf3: udf3,
          udf4: udf4,
          udf5: udf5
        })
        data = "#{PayU.key}|#{txn_id}|#{amount}|#{product_info}|#{first_name}|#{email}|#{udf1}|#{udf2}|#{udf3}|#{udf4}|#{udf5}||||||#{PayU.salt}"
        Digest::SHA512.hexdigest data 
      end

      def validate_hash(hash_str,
        txn_id:,
        amount:,
        product_info:,
        first_name:,
        email:,
        udf1: '',
        udf2: '',
        udf3: '',
        udf4: '',
        udf5: '',
        status:,
        additional_charges: ''
      )
      PayU::Validator.validate_hash_params({
        txn_id: txn_id,
        amount: amount,
        product_info: product_info,
        first_name: first_name,
        email: email,
        udf1: udf1,
        udf2: udf2,
        udf3: udf3,
        udf4: udf4,
        udf5: udf5
      })
      data = "|||||#{udf5}|#{udf4}|#{udf3}|#{udf2}|#{udf1}|#{email}|#{first_name}|#{product_info}|#{amount}|#{txn_id}|#{PayU.key}"
      data = additional_charges + data if additional_charges
      hash_str == Digest::SHA512.hexdigest("#{PayU.salt}|#{status}|#{data}")
      end
    end
  end
end
