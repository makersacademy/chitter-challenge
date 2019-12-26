require_relative '../web_helper.rb'

feature 'delete message' do

  scenario 'can delete message you have posted if signed in' do
    create_account
    sign_in
    post_message("Hello world")
    expect(page).to have_content "Hello world"
    click_on 'Log out'
    expect(page).not_to have_content "Delete"
    sign_in
    click_on 'Delete'
    expect(page).not_to have_content "Hello world"
  end

  scenario 'cannot delete message when not logged in' do
    create_account
    sign_in
    post_message("Hello world")
    expect(page).to have_content "Hello world"
    click_on 'Log out'
    expect(page).not_to have_content "Delete"
  end
end
