class Post < ActiveRecord::Base
  validates :name, presence: true
end
