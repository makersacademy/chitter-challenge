# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'I want to register my details to sign in' do
  scenario 'user should be able to enter details for registration' do
    visit('/')
    expect(page).to have_selector("input[value='Sign in']")
    click_button('Sign in')
    expect(current_path).to eq '/users/new'
    expect(page.status_code).to eq 200
  end
end

# feature 'registration' do
#   scenario 'a user can sign up' do
#     visit ('/users/new')
#     fill_in('names', with: 'Nazz Kadri')
#     fill_in('username', with: 'nazzk')
#     fill_in('email', with: 'test@example.com')
#     fill_in('password', with: 'password123')
#     click_button('Submit')
#     expect(page).to have_content "Welcome, nazzk"
#   end
# end
