require 'web_helper.rb'

feature 'log in' do

  scenario 'user can only post messages once logged in' do
    Account.create('dbacall', 'dbacall@hotmail.co.uk', 'password')
    visit '/'
    expect(page).not_to have_content 'Post Message'
    sign_in
    expect(page).to have_content 'Post Message'
  end

  scenario 'should not be able to log in with username that does not exist' do
    visit 'log_in'
    fill_in 'username', with: 'dbac'
    fill_in 'password', with: 'PASSWORD'
    click_on 'Sign in'
    expect(page).to have_content 'Username does not exist'
  end
end
