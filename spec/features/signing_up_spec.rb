# frozen_string_literal: true

require 'spec_helper'

feature 'Signing Up to Chitter' do
  scenario 'Signing up to Chitter' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO users VALUES(1, 'hello@gmail.com', '1234');")
    visit('/')
    expect(page).to have_content 'Sign Up'
  end
end
