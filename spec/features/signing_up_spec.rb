# frozen_string_literal: true

require 'spec_helper'

feature 'Signing Up to Chitter' do
  scenario 'Signing up to Chitter' do
    connection = PG.connect(dbname: 'chitter_test')
    visit('/users/new')
    fill_in 'email', with: 'hello@gmail.com'
    fill_in 'password', with: '1234'
    fill_in 'persons_name', with: 'Hi There'
    fill_in 'username', with: 'Hello'
    click_on 'Sign Up'
    visit('/')
    expect(page).to have_content "Hello, hello@gmail.com"
  end
  # scenario 'The user must submit a valid email' do
  #   connection = PG.connect(dbname: 'chitter_test')
  #   visit('/users/new')
  #   fill_in 'email', with: 'hellogmail.com'
  #   fill_in 'password', with: '1234'
  #   fill_in 'persons_name', with: 'Hi There'
  #   fill_in 'username', with: 'Hello'
  #   click_on 'Sign Up'
  #   visit('/')
  #   expect(page).not_to have_content "hellogmail.com"
  #   expect(page).to have_content "You must submit a valid email."
  # end
end
