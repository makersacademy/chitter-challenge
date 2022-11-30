require_relative './user'
require_relative './user_repository'

class UserParams
  def initialize(name, username, email, password)
    @name = name
    @username = username
    @email = email
    @password = password
  end

  def invalid_email?
    (@email !~ /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i) || duplicate_email?
  end

  def name_contains_incorrect_characters?
    @name.gsub!(/[^0-9A-Za-z -.]/, '') == @name 
  end

  def username_contains_incorrect_characters?
    @username.gsub!(/[^0-9A-Za-z-_]/, '') == @username 
  end

  def password_contains_incorrect_characters?
    @password.gsub!(/[^0-9A-Za-z .!?*@&+-,]/, '') == @password
  end

  def weak_password?
    @password.length < 8 || @password.count("0-9") == 0
  end 

  def duplicate_username?
    repo = UserRepository.new
    all_users = repo.all
    duplicate_username = false

    all_users.each do |user|
      if @username.downcase == user.username.downcase
        duplicate_username = true
      end
    end
    return duplicate_username
  end

  def duplicate_email?
    repo = UserRepository.new
    all_users = repo.all
    duplicate_email = false

    all_users.each do |user|
      if @email.downcase == user.email.downcase
        duplicate_email = true
      end
    end
    return duplicate_email
  end

  def invaild_user_params?
    invalid_email? || duplicate_username? || duplicate_email? || weak_password? || name_contains_incorrect_characters? || username_contains_incorrect_characters? || password_contains_incorrect_characters?
  end
end