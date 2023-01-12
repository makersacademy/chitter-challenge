class Reply < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
end
