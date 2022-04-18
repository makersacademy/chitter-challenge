class Peep < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :user

  def format_time
    time = created_at.strftime("%k:%M")
    date = created_at.strftime("%d/%m/%Y")
    "#{time} #{date}"
  end
end
