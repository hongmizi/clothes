class UserDomain
  def self.get_user_name user_id
    @user = User.find user_id
    return "#{@user.name} (#{@user.email})"
  end
end
