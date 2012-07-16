unless AWS[Rails.env]['S3KEY'] 
  AWS = YAML.load_file("#{Rails.root}/config/s3.yml")
end


