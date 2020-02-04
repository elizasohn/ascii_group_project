class Video < ApplicationRecord
  has_one_attached :clip
  validate :image_attached

  private

  def image_attached
    # if clip.attached? && !clip.content_type.in?(%w(video/mov video/mp4 video/avi))
    #
    #   errors.add(:clip, "Your movie must be an MOV, MP4 or an AVI, kind person.")
    # elsif
    if
      self.clip.attached? == false
      errors.add(:clip, 'Must have a video attached.')
    end
  end

  # def image_attached
  #   if clip.attached? == false
  #     errors.add(:clip, 'Please attach a video, friend.')
  #   end
  # end
end
