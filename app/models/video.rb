class Video < ApplicationRecord
  has_one_attached :clip
  validate :image_attached

  def extract_frames url
    puts "made it to extract_frames"
    movie = FFMPEG::Movie.new(url)
    puts "made it past movie declaration"
    movie.screenshot(
      "app/assets/images/frame_%d.jpg",
      { vframes: 30, frame_rate: '1' },
      validate: false
    )

    slideshow_transcoder = FFMPEG::Transcoder.new(
      '',
      'app/assets/images/slideshow.mp4', # output
      { resolution: "320x240" },
      input: "app/assets/images/frame_%d.jpg",
      input_options: { framerate: '30' }
    )
    slideshow = slideshow_transcoder.run
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
end
