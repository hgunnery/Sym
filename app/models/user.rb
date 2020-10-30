class User < ApplicationRecord
	enum user_type: { admin: 1, supervisor: 2, supporter: 3}

  has_secure_password

  before_create { generate_token(:auth_token) }

  belongs_to :supporter_level, optional: true
	has_many :votes, dependent: :destroy
	has_many :suggestions

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: true }
	validates :supporter_level, presence: true, if: :is_supporter?

	validates :password, presence: true, if: :should_validate_password?
	validates :password_confirmation, presence: true, if: :should_validate_password_confirmation?

	def should_validate_password?
    new_record? || password.present?
  end

	def should_validate_password_confirmation?
    new_record? || password.present?
  end

	def set_admin
		self.user_type = User.user_types[:admin]
	end

	def set_supervisor
		self.user_type = User.user_types[:supervisor]
	end

	def set_supporter
		self.user_type = User.user_types[:supporter]
	end

  def is_admin?
    self.user_type == "admin"
  end

  def is_supervisor?
    self.user_type == "supervisor"
  end

  def is_supporter?
    self.user_type == "supporter"
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
