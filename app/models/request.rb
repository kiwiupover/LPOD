class Request < ActiveRecord::Base
  attr_accessible :keyword, :title, :url
end
