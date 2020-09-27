require 'web_helpers'

feature 'sign in' do
  scenario 'user visits homepage and signs up then signs in and is redirected to the peep page that shows they are logged in' do
    clear_table
    sign_in
    expect(page).to have_content 'You are logged in as ollie@gmail.com'
  end
end
