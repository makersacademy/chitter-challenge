# frozen_string_literal: true
# require './app.rb'

feature 'Posting a message' do
  scenario 'user creates a new message which is displayed' do
    visit('/messages/new')
    fill_in('message', with: 'hello chitter')
    click_button('add')
    expect(current_path).to eq('/messages')
    expect(page).to have_content('hello chitter')
  end
end
