class User < ApplicationRecord
  has_secure_password

  before_create { generate_token(:auth_token) }

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

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
