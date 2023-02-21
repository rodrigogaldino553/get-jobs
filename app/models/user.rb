class User < ApplicationRecord
  after_create :assign_default_role

  rolify
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :timeoutable,
         jwt_revocation_strategy: JwtDenylist


  has_many :jobs, dependent: :destroy

  def assign_default_role
    if self.name.present?
      self.add_role(:company)
    else
      self.add_role(:user)
    end
  end
end