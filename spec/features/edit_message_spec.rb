require_relative '../web_helper.rb'

feature 'edit message' do

  scenario 'can edit message you have posted' do
    create_account
    sign_in
    post_message("Hello world")
    click_on 'Edit'
    fill_in 'message', with: 'Hello world!!!'
    click_on 'Submit'
    expect(page).to have_content 'Hello world!!!'
  end


end