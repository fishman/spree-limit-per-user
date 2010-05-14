class LimitPerUserHooks < Spree::ThemeSupport::HookListener

  insert_after :admin_product_form_right, 'shared/limit_per_user'
  replace :inside_product_cart_form, 'shared/cart_form'
  replace :cart_item_quantity, 'shared/order_quantity'

end
