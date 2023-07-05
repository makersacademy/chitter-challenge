class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, class_name: "Post"
  has_many :children, class_name: "Post", foreign_key: "parent_id"
end
