class Task < ApplicationRecord
    # Associations
    belongs_to :user

    # Validations
    validates :title, :deadline, presence: true
    before_validation :valid_date, on: :create

    # Extra configs
    default_scope -> { where(deleted_at: nil) }

    enum status: [ :to_do, :done ]

    def self.by_status(user_id)
        {
            to_do: self.where(status: 0, user_id: user_id),
            done: self.where(status: 1, user_id: user_id)
        }
    end

    def valid_date
        if self.deadline < Date.today
            self.errors.add(:base, "O prazo não pode estar no passado")
            false
        end
    end

    def soft_delete
        self.update(deleted_at: Time.current) if self.deleted_at.nil?
    end

end
