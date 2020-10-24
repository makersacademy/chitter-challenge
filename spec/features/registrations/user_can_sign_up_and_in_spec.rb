feature 'registrations' do
  scenario 'user can sign up and be signed in' do
    visit('/')
    click_button('Sign Up')
    fill_in "name",	with: "testuser" 
    fill_in "email",	with: "test@test.com" 
    fill_in "username",	with: "testusername"
    fill_in "password",	with: "Qwerty12345!" 
    click_button("Register")

    expect(page.current_path).to eq('/')
    expect(page).to have_content("Hi, testusername")
  end
end
