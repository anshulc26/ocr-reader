class Api::V1::ImagesController < Api::V1::ApiController
  require 'open-uri'

  before_filter :authenticate!
  skip_before_filter :verify_authenticity_token

  def image_to_string
    begin
      image = params[:image]
      if image.nil?
        render json: {status: 401, message: "The request must contain the image."}
        return
      end

      Dir.chdir(File.join(Rails.root.to_s, "public"))
      Dir.mkdir("uploads") unless File.directory?("uploads")
      image_name = image.split("/").last
      File.open(Rails.root.join('public', 'uploads', image_name), 'wb') do |file|
        file.write(open(image).read)
      end
      image = RTesseract.new(Rails.root.join('public', 'uploads', image_name).to_s)
      string = image.to_s
      render json: {status: 200, message: string}
    rescue => e
      Rails.logger.info "Image to String error (#{DateTime.now}): #{e}"
      render json: {status: 401, message: e}
    end
  end
end
