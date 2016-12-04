require 'spec_helper'
require './app/app.rb'
require './spec/features/web_helper.rb'

feature "Posting a peep" do

  before(:each) do
    User.create(name: 'Louisa Spicer',
                email: 'louisa@example.com',
                username: 'louisaspicer',
                password: 'greatpassword',
                password_confirmation: 'greatpassword')
  end

  scenario "Allow logged in user to post a peep" do
    login
    click_button('Post a Peep')
    expect(page).to have_content("Please enter your peep below:")
  end

  scenario "Once Peep has been posted, can be seen on Peeps page" do
    login
    click_button('Post a Peep')
    fill_in('peep', with: 'This is my first peep')
    click_button('Save')
    expect(page).to have_content("This is my first peep")
  end
end
