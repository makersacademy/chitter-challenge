# frozen_string_literal: true

require 'sinatra'

feature 'index page' do
  scenario 'shows content of posts' do
    visit('/')
    expect(page).to have_content('I am the best president OF ALL TIME!')
  end
end

feature 'index page' do
  scenario 'new post added' do
    visit('/')
    fill_in 'content', with: 'We MUST BUILD THE WALL NOW!'
    click_button('post')
    expect(page).to have_content('We MUST BUILD THE WALL NOW!')
  end
end
