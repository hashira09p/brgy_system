class Request < ApplicationRecord
  include AASM
  belongs_to :user

  aasm column: :state do
    state :pending, initial: true
    state :processing
    state :completed

    event :process do
      transitions from: :pending, to: :processing
    end

    event :complete do
      transitions from: [:pending, :processing], to: :completed
    end
  end
end