CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp') # adding these...
  config.cache_dir = 'carrierwave' # ...two lines
  
  config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => AWS[Rails.env]['S3KEY'],       # required
      :aws_secret_access_key  => AWS[Rails.env]['S3SEC']       # required
      #:region                 => 'us-west-1'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'lpod'                     # required
  config.cache_dir = "#{Rails.root}/public/uploads"
#  config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
#  config.fog_public     = false                                   # optional, defaults to true
#  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end