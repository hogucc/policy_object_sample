class UserPolicy
  def initialize(user)
    @user = user
  end

  def administrator_account_name?
    user.sign_in_count > 0 && user.role == "admin"
  end

  def use_email_as_name?
    user.full_name.blank? && user.email.present?
  end

  private

    attr_reader :user
end