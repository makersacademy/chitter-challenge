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


  scenario 'The signup email must be valid' do
    visit('/')
    click_link('Signup')
    expect(current_path).to eq '/users/new'
    fill_in "name", with: "Testy McTester"
    fill_in("username", with: 'Test')
    fill_in("email", with: 'testrtrterter64645645e@@@@rty!!!!''''t@gmail.com')
    fill_in("password", with: 'Test123')
    click_button('Signup')
    expect(page).to have_content "Please give us a real email FFS!"
  end
end
