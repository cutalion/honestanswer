# app/models/application_record.rb
class ApplicationRecord < ActiveRecord::Base # For AR apps
  self.abstract_class = true
end
