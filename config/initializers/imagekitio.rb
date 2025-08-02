ImageKitIo.configure do |config|
  config.public_key = ENV["IMAGEKIT_PUBLIC_KEY"]
  config.private_key = ENV["IMAGEKIT_PRIVATE_KEY"]
  config.url_endpoint = ENV["IMAGEKIT_URL_ENDPOINT"] # https://ik.imagekit.io/your_imagekit_id
  config.service = :active_storage
  # config.constants.MISSING_PRIVATE_KEY = 'custom error message'
end
