require 'web_helper.rb'

feature 'log in' do

  scenario 'user can only post messages once logged in' do
    Account.create('dbacall', 'dbacall@hotmail.co.uk', 'password')
    visit '/'
    expect(page).not_to have_content 'Post Message'
    sign_in
    expect(page).to have_content 'Post Message'
  end

end
