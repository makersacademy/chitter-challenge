require 'spec_helper'

feature 'user can write a peep' do
  scenario 'they sign up and write a peep' do
    visit '/'
    sign_up
    visit '/peeps/new'
    fill_in('Title', with: 'New Peep!')
    fill_in('Body', with: 'This is a new peep')
    click_button('Make Peep')
    expect(page).to have_content('This is a new peep')
  end

  scenario 'only logged in users can write peeps' do
    visit '/peeps/new'
    expect(page).to have_content('you cannot make a new peep')
  end
end

feature 'user can view all peeps in reverse chronological order' do
  scenario 'they view 1 peep' do
    visit '/'
    sign_up
    visit '/peeps/new'
    fill_in('Title', with: 'New Peep!')
    fill_in('Body', with: 'This is a new peep')
    click_button('Make Peep')
    visit '/peeps/all'
    expect(page).to have_content('This is a new peep')
  end

  xscenario 'they view 3 peeps, in reverse chronological order' do
  end
end

def sign_up(name = 'George', email = 'me@georgemcgowan.com',
            username = 'cat', password = '12345')
  visit '/'
  fill_in('Name', with: name)
  fill_in('Email', with: email)
  fill_in('Username', with: username)
  fill_in('Password', with: password)
  click_button('Sign Up')
end