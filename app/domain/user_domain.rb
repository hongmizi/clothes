class UserDomain
  def self.get_user_name user_id
    @user = User.find user_id
    return "#{@user.name} (#{@user.email})"
  end

  def self.get_user_cart_line_items user_id
    user = User.find_by_id user_id
    if user.blank? || user.cart.blank?
      return 0
    end

    return user.cart.line_items.count
  end
end
