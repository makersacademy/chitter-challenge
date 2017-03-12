# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature "sign_in" do
  scenario "user can sign in using username and password" do
    sign_in
    expect(page).to have_content 'Welcome, Natalia!'
  end
end
