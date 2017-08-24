class Member < ActiveRecord::Base
  belongs_to :user
  belongs_to :ninja, class_name: 'User'
end
