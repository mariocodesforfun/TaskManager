class Task < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :status, presence: true
end
