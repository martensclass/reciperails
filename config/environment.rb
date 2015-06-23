# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

#added this for image upload carrierwave gem
require 'carrierwave/orm/activerecord'