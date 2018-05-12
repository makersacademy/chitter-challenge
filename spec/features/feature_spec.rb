require_relative '../../app.rb'
require 'spec_helper'
require 'pg'

feature Chitter do

  feature 'Viewing all peeps' do
    scenario 'User is able to see all peeps' do
      visit('/')
      fill_in 'text', with: 'Hello World!'
      fill_in 'author', with: 'Sam Worrall'
      click_button 'Post new Peep'
      expect(page).to have_content "Sam Worrall:\nHello World!"
    end
  end
end
