feature 'Sign up and log in' do
  scenario 'User can sign up' do
    visit('/')
    click_button('Sign Up')
    expect(current_path).to eq "/users/new"
    fill_in('username', with: "user001")
    fill_in('password', with: "password123")
    click_button('Sign Up')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'You are signed in as user001'
  end

  scenario 'User can log in' do
    visit('/')
    click_button('Log In')
    expect(current_path).to eq "/users/sign_in"

  end
end
