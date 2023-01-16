# frozen_string_literal: true

class User < ActiveRecord::Base
  attr_accessor :id, :first_name, :email, :last_name, :username, :hashed_password_id

  def authentication

  end
end
