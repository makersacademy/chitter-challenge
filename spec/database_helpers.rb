# frozen_string_literal: true

require 'pg'

def persisted_data(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = #{id};").first
end

def create_new_user_sql(username:, email:, password:)
  DatabaseConnection.query(
    %(INSERT INTO users (username, email, password)
      VALUES('#{username}', '#{email}', '#{password}')
      RETURNING id, username, email, password)
  )
end

# def standard_bookmarks
#   create_new(url: 'http://www.makersacademy.com', title: 'Makers Academy')
#   create_new(url: 'http://www.twitter.com', title: 'Twitter')
#   create_new(url: 'http://www.google.com', title: 'Google')
# end
#
# def create_new_tag_sql(content:)
#   DatabaseConnection.query(
#     %{INSERT INTO tags (content)
#     VALUES('#{content}') RETURNING id, content}
#   )
# end
#
# def create_new_bookmark_tag_sql(bookmark_id:, tag_id:)
#   DatabaseConnection.query(
#     %{INSERT INTO bookmarks_tags (bookmark_id, tag_id)
#       VALUES('#{bookmark_id}', '#{tag_id}') RETURNING bookmark_id, tag_id}
#   )
# end
