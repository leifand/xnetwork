class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :padewan, class_name: 'User'
end
