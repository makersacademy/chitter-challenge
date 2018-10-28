require_relative 'user'
require 'pry'

module Tagger
  def self.tag(content)
    User.all.each do |user|
      tag = "@#{user.username}"
      path = "/users/#{user.username}"
      if content.include?(tag)
        content.gsub!(tag, link(tag, path))
      end
    end
    content
  end

  private

  def self.link(string, path)
    "<a href='#{path}'>#{string}</a>"
  end

  def self.tags?(user)
    @content.include?("@#{user.username}")
  end

end
