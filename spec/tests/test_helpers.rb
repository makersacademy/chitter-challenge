# frozen_string_literal: true

require 'pg'

def find_id_from_username(username)
  connection.query("SELECT * FROM users WHERE username = '#{username}'").first['id']
end

def find_info_from_id(user_info, user_id)
  connection.query("SELECT * FROM users WHERE id = #{user_id};").first[user_info]
end

def connection
  PG.connect(dbname: 'chitter_zimmja_test')
end
