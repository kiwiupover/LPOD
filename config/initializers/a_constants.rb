
unless ENV['S3KEY'] || ENV['S3SEC']
  AWS = YAML.load_file("#{Rails.root}/config/s3.yml")
  ENV['S3KEY'] ||= AWS[Rails.env]['S3KEY']
  ENV['S3SEC'] ||= AWS[Rails.env]['S3SEC']
end

unless ENV['SEMRUSH']
  SEM = YAML.load_file("#{Rails.root}/config/semrush.yml")
  ENV['SEMRUSH'] ||= SEM[Rails.env]['SEMRUSH']
end

