class Maker < ActiveRecord::Base
    has_many :peeps
  
    def self.login(username, password)
      create(username: username, password: password)
    end
  end
  