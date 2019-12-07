class Peep < ActiveRecord::Base
  attr_reader :body, :likes, :user_id, :created_at

  def initialize(thing)
    @body = thing[:body]
    @likes = thing[:likes]
    @user_id = thing[:user_id]
    @crerated_at = thing[:created_at]
  end
end
