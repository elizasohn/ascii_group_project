class Video < ApplicationRecord
  has_one_attached :clip
  # validates :video, presence: true
end
