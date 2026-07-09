class User < ApplicationRecord
  validates :user_login, uniqueness: {allow_nil: false}, presence: true
  validates :email, uniqueness: {allow_nil: false}, presence: true
  validates :user_password, presence: true
  
  has_one :user_desc
  
  def is_real_admin?()
    self.is_real_admin == 1
  end

  def User.check_user(login, password)
    User.where("user_login = ? AND user_password = '#{password}'", login).to_a.first
  end
end
