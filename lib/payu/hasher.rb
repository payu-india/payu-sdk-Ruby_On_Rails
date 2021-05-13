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
        
=begin
       Response received from Payment Gateway at this page.
It is absolutely mandatory that the hash (or checksum) is computed again after you receive response from PayU and compare it with request and post back parameters. This will protect you from any tampering by the user and help in ensuring a safe and secure transaction experience. It is mandate that you secure your integration with PayU by implementing Verify webservice and Webhook/callback as a secondary confirmation of transaction response.

Hash string without Additional Charges -
hash = sha512(SALT|status||||||udf5|||||email|firstname|productinfo|amount|txnid|key)

With additional charges - 
hash = sha512(additionalCharges|SALT|status||||||udf5|||||email|firstname|productinfo|amount|txnid|key)
=end
        
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
