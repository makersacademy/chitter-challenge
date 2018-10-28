require_relative 'user'
require 'pry'

module Tagger
  def self.tag(content)
    User.all.each do |user|
      tag = "@#{user.username}"
      path = "/users/#{user.username}"
      if tags?(content, user)
        content.gsub!(tag, link(tag, path))
      end
    end
    content
  end

  def self.link(string, path)
    "<a href='#{path}'>#{string}</a>"
  end

  def self.tags?(content, user)
    content.include?("@#{user.username}")
  end

end
