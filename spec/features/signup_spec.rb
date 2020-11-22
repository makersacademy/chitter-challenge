require 'pg'

feature "Signup" do
  scenario "User can sign up to Chitter" do
    visit '/'
    click_link('Signup')
    expect(current_path).to eq '/users/new'
    fill_in "name", with: "Testy McTester"
    fill_in("username", with: 'Test')
    fill_in("email", with: 'test@gmail.com')
    fill_in("password", with: 'Test123')
    click_button('Signup')
    expect(page).to have_content "Welcome Test"
  end
end


