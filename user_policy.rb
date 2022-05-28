class UserPolicy
  def initialize(user)
    @user = user
  end

  def administrator_account_name?
    user_signed_in? && user_is_administrator?
  end

  def use_email_as_name?
    user_does_not_have_full_name? && user_has_email?
  end

  private

    attr_reader :user

  def user_does_not_have_full_name?
    user.full_name.blank?
  end

  def user_has_email?
    user.email.present?
  end

  def user_signed_in?
    user.sign_in_count > 0
  end

  def user_is_administrator?
    user.role == "admin"
  end
end
