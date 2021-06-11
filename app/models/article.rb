class Article < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
end
