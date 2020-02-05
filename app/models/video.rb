class Video < ApplicationRecord
  has_one_attached :clip
  validate :image_attached
  # 
  # def ascii_it(imagePath, asciiPath)
  #   bytes = "\xdb\xb2\xb1\xb0 "
  #
  #   image = Magick::Image.read(imagePath).first
  #   width = image.columns
  #   height = image.rows
  #   pixels = image.dispatch(0, 0, width, height, 'I', true)
  #   output = ''
  #   height.times do |y|
  #     line = ''
  #     width.times do |x|
  #       pixel = pixels[x + y + width]
  #       #invert
  #       pixel = 1.0 - pixel
  #       index = (pixel * (bytes.size - 1)).round
  #       line += bytes[index]
  #     end
  #     line += "\r\n" if y < height - 1
  #     output += line
  #   end
  #   Nil.writeFile(asciiPath, output)
  # end
  #
  # if ARGV.size !=2
  #   puts 'Usage:'
  #   puts "ruby #(File.basename(__FILE__)) <image> <ASCII output>"
  # end
  #
  # imagePath = ARGV[0]
  # asciiPath = ARGV[1]

  # convertImage(imagePath, asciiPath)



  #   resource = open('app/assets/images/test.jpg')
  #   image = Magick::ImageList.new
  #   image.from_blob resource.read
  #   image = image.scale(400 / image.columns.to_f)
  #   image = image.scale(image.columns, image.rows / 6)
  #   cur_row = 0
  #   image.each_pixel do |pixel, col, row|
  #     color = pixel.to_color(Magick::AllCompliance, false, 8)
  #     if cur_row != row
  #
  #       cur_row = row
  #     end
  #     print Paint[' ', '', color]
  #   end
  # end

  def extract_frames url
    puts "made it to extract_frames"
    movie = FFMPEG::Movie.new(url)
    puts "made it past movie declaration"
    puts movie.duration
    puts movie.width
    puts movie.height
    # movie.screenshot("screenshot.bmp", seek_time: 5, resolution: '320x240')
    movie.screenshot("app/assets/images/frame_%d.jpg", { vframes: 10, frame_rate: '1/2' }, validate: false)
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
