# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class LimitPerUserExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/limit_per_user"

  # Please use limit_per_user/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate

    Product.class_eval do
      def already_purchased?
        purchased = false

        user = UserSession.find.user if UserSession.find
        if user
          orders = Order.find_all_by_user_id user.id
        else
          orders = []
        end
        orders.each do |order|
          line_item = LineItem.conditions('variant_id = ? AND order_id = ?', master.id, order.id).all
          purchased = true if line_item.size > 0
        end
        purchased
      end
    end

    LineItem.class_eval do
      def increment_quantity
        self.quantity
      end

      def decrement_quantity
        self.quantity
      end
    end
  end
end
