class Message < ActiveRecord::Base

  belongs_to :user

  def tag(content)
    content.include? "@"
  end

end
