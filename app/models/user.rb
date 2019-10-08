class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable

  has_many :tasks
end
