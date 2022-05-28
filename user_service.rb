class UserService
  def initialize
    @user = user
  end

  def name
    user_policy.use_email_as_name? ? user.email : user.full_name
  end

  def account_name
    user_policy.administrator_account_name? ? "Administrator" : "User"
  end

  private

    attr_reader :user
  
    def user_policy
      @_user_policy ||= UserPolicy.new(user)
    end
end
