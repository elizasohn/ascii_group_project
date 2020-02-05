class Video < ApplicationRecord
  has_one_attached :clip
  validate :image_attached

  def extract_frames url
    puts "made it to extract_frames"
    movie = FFMPEG::Movie.new(url)
    puts "made it past movie declaration"
    puts movie.duration
    puts movie.width
    puts movie.height
    # movie.screenshot("screenshot.bmp", seek_time: 5, resolution: '320x240')
    movie.screenshot(
      "app/assets/images/frame_%d.jpg", 
      { vframes: 20, frame_rate: '1.5' }, 
      validate: false
    )
  end

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
