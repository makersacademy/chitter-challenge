require 'spec_helper'

feature 'View posts' do

  scenario 'I can see posts on the post page' do
    Post.create(message: 'random chitter chatter')
    # Post.create(username: 'loliphant', message: 'random chitter chatter')
    visit '/'
    expect(page.status_code).to eq 200
    within 'ul#posts' do
      expect(page).to have_content('random chitter chatter')
    end
    # within 'ul#posts' do
    #   expect(page).to have_content('loliphant', 'random chitter chatter')
    # end
  end
end
