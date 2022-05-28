class UserService
  def initialize
    @user = user
  end

  def name
    if user.full_name.blank? && user.email.present?
      user.email
    else
      user.full_name
    end
  end

  def account_name
    if user.sign_in_count > 0 && user.role == "admin"
      "Administrator"
    else
      "User"
    end
  end

  private
  
    attr_reader :user
end
