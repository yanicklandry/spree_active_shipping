require_dependency 'spree/calculator'

module Spree
  class Calculator < ActiveRecord::Base
    module CanadaPost
      class Priority < Calculator::Ups::Base
        def self.description
          I18n.t("canada_post.priority")
        end
      end
    end
  end
end
