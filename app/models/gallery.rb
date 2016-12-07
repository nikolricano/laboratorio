class Gallery < ActiveRecord::Base
  belongs_to :user
  mount_uploader :file, FileUploader
end
