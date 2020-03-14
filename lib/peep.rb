# frozen_string_literal: true

require_relative 'database_connection'
require 'uri'

class Peep
  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps;')
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text']
      )
    end
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (text) VALUES('#{text}') RETURNING id, text;")
    Peep.new(
      id: result[0]['id'],
      text: result[0]['text']
      )
  end

  # def self.delete(id:)
  #   DatabaseConnection.query("DELETE FROM bookmarks_tags WHERE bookmark_id = #{id}")
  #   DatabaseConnection.query("DELETE FROM comments WHERE bookmark_id = #{id}")
  #   DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  # end

  # def self.update(id:, url:, title:)
  #   result = DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id} RETURNING id, url, title;")
  #   Bookmark.new(
  #     id: result[0]['id'],
  #     title: result[0]['title'],
  #     url: result[0]['url']
  #   )
  # end

  # def self.find(id:)
  #   result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  #   Bookmark.new(
  #     id: result[0]['id'],
  #     title: result[0]['title'],
  #     url: result[0]['url']
  #   )
  # end

  # def self.where(tag_id:)
  #   result = DatabaseConnection.query("SELECT id, title, url FROM bookmarks_tags INNER JOIN bookmarks ON bookmarks.id = bookmarks_tags.bookmark_id WHERE bookmarks_tags.tag_id = '#{tag_id}';")
  #   result.map do |bookmark|
  #     Bookmark.new(
  #       id: bookmark['id'],
  #       title: bookmark['title'],
  #       url: bookmark['url']
  #     )
  #   end
  # end

  # def comments(comment_class = Comment)
  #   comment_class.where(bookmark_id: id)
  # end

  # def tags(tag_class = Tag)
  #   tag_class.where(bookmark_id: id)
  # end

  # private

  # def self.is_url?(url)
  #   url =~ /\A#{URI.regexp(%w[http https])}\z/
  # end
end
