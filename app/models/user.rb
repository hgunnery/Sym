class User < ApplicationRecord
  has_secure_password

  belongs_to :user_type

  validates_presence_of :email
  validates_uniqueness_of :email

  def is_admin?
    self.user_type_id == 1
  end

  def is_supervisor?
    self.user_type_id == 2
  end

  def is_supporter?
    self.user_type_id == 3
  end

  def full_name
    "#{first_name} #{last_name}".presence or name
  end
end
