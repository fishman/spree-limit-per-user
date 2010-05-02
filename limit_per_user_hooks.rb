class LimitPerUserHooks < Spree::ThemeSupport::HookListener

  insert_after :admin_product_form_right, 'shared/limit_per_user'

end
