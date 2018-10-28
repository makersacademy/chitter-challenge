require_relative './web_helpers.rb'

feature 'index page' do

  scenario 'user can sign up to Chitter' do
    sign_in
    expect(page).to have_content 'Hello Gordon'
  end

  scenario 'user can not signup if their email and password are not unique' do
    sign_in
    sign_in
    expect(page).to have_content 'Both username and email must be unique.'
  end
end

# feature 'peeps' do
#   scenario 'user posts to Chitter and then sees it on the homepage' do
#     fill_in('peep', with: 'This is my first ever peep!')
#     click_button 'Post'
#     expect(page).to have_content 'This is my first ever peep!'
#   end
# end
