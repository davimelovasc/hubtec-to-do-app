class Task < ApplicationRecord
    belongs_to :user

    enum status: [ :to_do, :done ]

    def self.by_status(user_id)
        {
            to_do: self.where(status: 0, user_id: user_id, deleted_at: nil),
            done: self.where(status: 1, user_id: user_id, deleted_at: nil)
        }
    end
end
