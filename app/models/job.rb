class Job < ApplicationRecord
  belongs_to :user

  # add validation to permit only users with company role to create jobs
end
