class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :status, presence: true


end
