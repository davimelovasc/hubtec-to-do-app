class Task < ApplicationRecord
    belongs_to :user

    validates :title, :deadline, presence: true
    before_validation :valid_date, on: :create

    enum status: [ :to_do, :done ]

    def self.by_status(user_id)
        {
            to_do: self.where(status: 0, user_id: user_id, deleted_at: nil),
            done: self.where(status: 1, user_id: user_id, deleted_at: nil)
        }
    end

    def valid_date
        if self.deadline < Date.today
            self.errors.add(:base, "O prazo não pode estar no passado")
            false
        end
    end

end
