# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { maximum: 280 }
  has_many :likes
end
