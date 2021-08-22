class Peep < ActiveRecord::Base
  has_many :replies,
           class_name: 'Peep',
           foreign_key: "superpeep_id"

  belongs_to :superpeep,
             class_name: "Peep",
             optional: true

  belongs_to :user,
             class_name: 'User',
             foreign_key: "user_id"
end
