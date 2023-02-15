class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :timeoutable,
         jwt_revocation_strategy: JwtDenylist
end