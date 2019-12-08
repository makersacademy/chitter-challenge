require 'web_helper.rb'

feature 'post message' do

  scenario 'user can post 1 message to chitter' do
    Account.create('dbacall', 'dbacall@hotmail.co.uk', 'password')
    sign_in
    post_message('Hello world')
    expect(page).to have_content 'Hello world'
  end

  scenario 'username appears next message' do
    Account.create('dbacall', 'dbacall@hotmail.co.uk', 'password')
    sign_in
    post_message('Hello world')
    expect(page).to have_content '@dbacall:'
  end
end
