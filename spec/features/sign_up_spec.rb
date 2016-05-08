require 'spec_helper'

feature 'Signing up' do

  scenario 'should have a link to a sign-up page from the homepage' do
    visit('/')
    click_link('Sign up')
    expect(page).to have_content('Sign up for Chitter below')
  end

  # scenario 'should have a sign-up form that the user can fill in' do
  #   visit('sign_up')
  #   fill_in('name', with: 'Adam')
  #   fill_in('email', with: 'adamskee@yahoo.com')
  #   fill_in('handle', with: 'Poowee')
  #   fill_in('password', with: 'xyz246')
  #   click_button('Sign up')
  #   expect(page).to have_content('Thanks for signing up!')
  # end

  scenario 'should confirm user\'s name on sign-up' do
    visit('sign_up')
    fill_in('name', with: 'Adam')
    fill_in('email', with: 'adamskee@yahoo.com')
    fill_in('handle', with: 'Poowee')
    fill_in('password', with: 'xyz246')
    click_button('Sign up')
    expect(page).to have_content('Thanks for signing up, Adam!')
  end
end


# test for valid email

# test for no duplicate user name

# test for valid password

# test that a record is created (rspec?)


# link = Link.first
# expect(link.tags.map(&:name)).to include('education', 'programming')
# end
