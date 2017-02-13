require 'spec_helper'

RSpec.feature 'adding peeps', :type => :feature do

  include Helpers

  let!(:user) do
    User.create(firstname: 'John',
      surname: 'Doe',
      email: 'john@doe.com',
      username: 'JayDawg',
      password: 'password123',
      password_confirmation: 'password123')
  end
  
  scenario 'user can add a new peep' do
    sign_in(email: 'john@doe.com', password: 'password123')
    visit '/peeps/new'
    expect(page.status_code).to eq 200

    fill_in :text, :with => 'Hello world!'
    click_button 'Peep!'
    
    within 'ul#peeps' do
      expect(page).to have_content('John Doe @JayDawg')
      expect(page).to have_content('Hello world!')
    end
  end

  scenario 'user cannot add a peep if they are not signed in' do
    visit '/peeps/new'
    expect(page.status_code).to eq 200

    fill_in :text, :with => 'Hello world!'
    click_button 'Peep!'

    expect(page).to have_content('You must be signed in to peep!')
  end

end
