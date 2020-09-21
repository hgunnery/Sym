class User < ApplicationRecord
  belongs_to :user_type

  def is_admin?
    self.user_type_id == 1
  end

  def is_supervisor?
    self.user_type_id == 2
  end

  def is_supporter?
    self.user_type_id == 3
  end
end
