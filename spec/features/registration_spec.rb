require 'spec_helper'

feature 'user registration' do

  scenario 'user visits homepage and registers' do
    visit '/'
    click_button 'Register'
    expect(page.status_code).to eq 200
    expect(page).to have_current_path '/users/new', only_path: true
    fill_in :name, with: 'Johnny'
    fill_in :handle, with: 'Johnny_Boy'
    fill_in :email, with: 'johnny@jimbob.com'
    fill_in :password, with: '1234'
    fill_in :password_confirmation, with: '1234'
    click_button 'Sign up!'
    expect(page.status_code).to eq 200
    expect(page).to have_current_path '/users', only_path: true
    expect(page).to have_content 'Welcome Johnny!'
  end

end
