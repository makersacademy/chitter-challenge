# frozen_string_literal: true

require 'pg'

describe Chitter do
  feature 'Homepage' do
    before(:each) { visit('/') }
    scenario 'Presents a list of peeps to the user' do
      %w[rock baby crazy].each { |peep| expect(page).to have_content peep }
    end
    scenario 'Peeps are presented with user names' do
      %w[Starchild Catman Demon].each { |username| expect(page).to have_content username }
    end
    scenario 'Peeps are presented with full names' do
      %w[Stanley Singer Simmons].each { |fullname| expect(page).to have_content fullname }
    end
    scenario 'Displays the current username' do
      expect(page).to have_content 'none'
    end
  end
  
  feature 'Sign-up' do
    scenario 'Changes the username display on the Homepage' do
      visit('/')
      click_link('Sign up')
      fill_in('username', with: 'Fox')
      fill_in('fullname', with: 'Eric Carr')
      fill_in('password', with: 'password')
      fill_in('email', with: 'fox@gmail.com')
      click_button('Enter details')
      expect(page).to have_content 'Fox'
    end
  end

  feature 'Post peep' do
    scenario 'Adds and displays a peep on the Homepage' do
      visit('/')
      my_peep = 'Kiss & Iron Maiden at Download Festival 2022'
      fill_in('peep', with: my_peep)
      click_button('Peep!')
      expect(page).to have_content my_peep
    end
  end
end
