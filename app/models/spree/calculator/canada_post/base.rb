require_dependency 'spree/calculator'

module Spree
  class Calculator < ActiveRecord::Base
    module CanadaPost
      class Base < Spree::Calculator::ActiveShipping::Base
        def carrier
          carrier_details = {
            :login => Spree::ActiveShipping::Config[:canada_post_login],
            #:password => Spree::ActiveShipping::Config[:canada_post_password],
            #:key => Spree::ActiveShipping::Config[:canada_post_key],
            #:test => Spree::ActiveShipping::Config[:test_mode]
          }

          if shipper_number = Spree::ActiveShipping::Config[:shipper_number]
            carrier_details.merge!(:origin_account => shipper_number)
          end

          ActiveMerchant::Shipping::CanadaPost.new(carrier_details)
        end
      end
    end
  end
end
