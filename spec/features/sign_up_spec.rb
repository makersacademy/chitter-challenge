require 'web_helper.rb'

feature 'sign up' do

  scenario 'user can create an account' do
    visit '/'
    create_account
    expect(page).to have_content 'Account created. Welcome dbacall!'
  end

  scenario 'should raise an error if email already assigned to an account' do
    Account.create('dbacall', 'dbacall@hotmail.co.uk', 'password')
    visit '/'
    create_account
    expect(page).to have_content 'Email already in use!'
  end

end