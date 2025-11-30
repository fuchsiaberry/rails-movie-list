class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, uniqueness: true
end
