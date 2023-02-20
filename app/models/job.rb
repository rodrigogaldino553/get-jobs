class Job < ApplicationRecord
  belongs_to :user_id

  private

    def generate_permalink
      # instead use the primary key, use the permalink field to show jbs to users with more privacity
      self.permalink = SecureRandom.hex(8)
    end
end
