require 'pg'

class Chitter
  def self.all
    [
      "This is my first Chitter post!",
      "This is my second Chitter post!", 
      "This is my third Chitter post!"
    ]
  end 
end
