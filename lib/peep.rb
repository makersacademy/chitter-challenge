# frozen_string_literal: true

require_relative 'database_connection'
require 'uri'
require_relative './user.rb'

class Peep
  attr_reader :id, :text, :created_at, :user_id

  def initialize(id:, text:, created_at:, user_id:)
    @id = id
    @text = text
    @created_at = created_at
    @user_id = user_id
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps;')
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'],
        created_at: peep['created_at'],
        user_id: peep['user_id']
      )
    end
  end

  def self.create(user_id:, text:)
    result = DatabaseConnection.query("INSERT INTO peeps (user_id, text) VALUES ('#{user_id}', '#{text}') RETURNING id, text, created_at, user_id;")
    Peep.new(
      id: result[0]['id'],
      text: result[0]['text'],
      created_at: result[0]['created_at'],
      user_id: result[0]['user_id']
      )
  end


  def users(user_class = User)
    user_class.find(user_id: id)
  end

  # def tags(tag_class = Tag)
  #   tag_class.where(bookmark_id: id)
  # end

  # private

  # def self.is_url?(url)
  #   url =~ /\A#{URI.regexp(%w[http https])}\z/
  # end
end
