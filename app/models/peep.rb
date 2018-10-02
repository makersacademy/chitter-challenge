require 'dm-timestamps'
require_relative './user'
require_relative './reply'

class Peep
  include DataMapper::Resource
  property :id, Serial
  property :message, Text, length: 1..141
  property :created_at, DateTime
  belongs_to :user
  has n, :reply

  def self.find_mentions(message)
    mentions = []
    message.split.each do |word|
      if word.chars.first == "@"
        word.slice!(0)
        mentions.push(word)
      end
    end
    mentions
  end
end
