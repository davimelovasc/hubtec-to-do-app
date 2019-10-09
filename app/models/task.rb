class Task < ApplicationRecord
    belongs_to :user

    validate :valid_date

    enum status: [ :to_do, :done ]

    def self.by_status(user_id)
        {
            to_do: self.where(status: 0, user_id: user_id, deleted_at: nil),
            done: self.where(status: 1, user_id: user_id, deleted_at: nil)
        }
    end

    def valid_date
        if self.deadline < Date.today
            errors.add(:data_inválida, ", o prazo não pode estar no passado")
        end
    end

end
