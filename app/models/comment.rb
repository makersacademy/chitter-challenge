class Comment < ApplicationRecord
  belongs_to :peep
  belongs_to :user
end
