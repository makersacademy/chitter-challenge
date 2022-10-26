require 'rack'
require 'uri'
require_relative './user_repository'

class Utilities
  def sanitize(input)
    Rack::Utils.escape_html(input)
  end

  def check_for_tag(content)
    tags = content.scan(/@\w+/)
    return nil if tags.empty?

    tags.map { |tag| tag.delete('@') }
  end

  def find_email_addresses(usernames)
    repo = UserRepository.new

    email_addresses = usernames.map do |username|
      repo.find_by_username(username).email
    end

    return nil if email_addresses.empty?

    email_addresses
  end

  def validate_username(username)
    regex = /^[A-Za-z0-9]+(?:[_-][A-Za-z0-9]+)*$/
    regex.match?(username)
  end

  def validate_name(name)
    regex = /^[A-Za-z0-9]+(?:[ -][A-Za-z0-9]+)*$/
    regex.match?(name)
  end

  def validate_email(email_address)
    regex = URI::MailTo::EMAIL_REGEXP
    regex.match?(email_address)
  end

  def send_email(_email_address)
    # Add class and methods to send email via Ruby
    true
  end
end
