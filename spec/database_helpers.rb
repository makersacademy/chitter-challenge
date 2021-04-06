# frozen_string_literal: true

require 'pg'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end

def create_new_user_and_write_a_peep
  # Create new user
  visit('users/new')
  fill_in('name', with: "test")
  fill_in('username', with: "testing")
  fill_in('password', with: "password123")
  fill_in('email', with: "test@email.com")
  click_button "Submit"
  # Write peep and see it appear
  fill_in('peep', with: "Hello this is a peep")
  click_button "Post"
end

def create_new_user
  User.create(email: 'test@example.com', password: 'password123', name: 'Ollie', username: 'ob')
end
