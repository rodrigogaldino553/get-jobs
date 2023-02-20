class User < ApplicationRecord
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end


  rolify
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :timeoutable,
         jwt_revocation_strategy: JwtDenylist
end