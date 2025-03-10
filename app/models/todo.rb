class Todo < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true

  attribute :status, :integer

  enum :status, {
    todo: 0,
    wip: 1,
    done: 2,
    pending: 3
  }
end
