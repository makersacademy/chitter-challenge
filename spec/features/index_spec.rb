feature 'welcome page' do
  scenario 'user can see welcome page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

# feature 'login' do
#   scenario 'on welcome page, user clicks login' do
#     visit('/index')
#     click_link('login')
#     expect(page).to have_content "Log back in!"
#   end
# end
#
# feature 'register' do
#   scenario 'on welcome page, user clicks register' do
#     visit('/index')
#     click_link('register')
#     expect(page).to have_content "Create a new account!"
#   end
# end
