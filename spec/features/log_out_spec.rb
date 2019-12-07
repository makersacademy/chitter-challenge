require 'web_helper.rb'

feature 'log out' do

  scenario 'user should be able to log out' do
    Account.create('dbacall', 'dbacall@hotmail.co.uk', 'password')
    sign_in
    click_on 'Log out'
    expect(page).not_to have_content 'Post Message'
  end

end
