require_relative '../factories/user'
require 'spec_helper'

feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    user = User.create(name: 'Test Test',
                username: 'testtest',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')

    visit '/sessions/new'
    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'

    visit '/peeps/new'
    fill_in :content, with: 'This is a peep'
    click_button 'Peep Content'

    within 'ul#peeps' do
      expect(page).to have_content('This is a peep')
    end
  end

  scenario 'There are no links in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

  scenario 'I can only create a new peep if signed in' do
    user = User.create(name: 'Test Test',
                username: 'testtest',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')

    visit '/sessions/new'
    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'

    click_button 'Sign out'

    visit '/peeps/new'
    # expect(page).to have_content 'happening'
    # fill_in 'content', with: 'This is a peep'
    # click_button 'Peep Content'
    expect(page).to have_content('Please sign in or sign up first')
  end

end
