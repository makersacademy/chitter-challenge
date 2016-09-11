require 'spec_helper'

feature 'Posting peeps' do

  scenario 'A user can post peeps' do
    visit '/users/signup'
    fill_in 'username', with: 'testuser1'
    fill_in 'name', with: 'Test User'
    fill_in 'email', with: 'testuser1@gmail.com'
    fill_in 'password', with: 'testpassword1'
    fill_in 'password_confirmation', with: 'testpassword1'
    click_button 'Sign up'

    visit '/peeps/new'
    fill_in 'peep', with: "This is a resting peep #{Time::now}"
    expect { click_button 'Peep'}.to change(Peeps, :count).by 1
  end

  scenario 'Peeps cannot be anonymous' do
    visit '/peeps/new'
    fill_in 'peep', with: "This is a resting peep #{Time::now}"
    expect { click_button 'Peep'}.to change(Peeps, :count).by 0
  end
end
