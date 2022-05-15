feature "Sign up" do
  scenario 'user can sign up to use chitter' do
    visit('/signup')
    expect(page).to have_content 'Chitter'
    expect(page).to have_content 'To send peeps you need to create an account'
    expect(page).to have_content 'Login'
    expect(page).to have_content 'Create Account'

    fill_in :user_name, with: "amfibiya17"
    fill_in :password, with: "12345678"
    fill_in :email, with: 'test@email.com'
    
    expect(page).to have_button 'Create Account'
    click_button 'Create Account'
  end

  scenario "user can't sign up to use chitter - not enough characters" do
    visit('/signup')

    fill_in :user_name, with: "7"
    fill_in :password, with: "8"
    fill_in :email, with: 'test@email.com'
    click_button 'Create Account'
    
    expect(page).to have_content "Username or email is too short"
  end

  scenario "user can't sign up to use chitter - user already exists" do
    sign_up
    sign_up

    expect(page).to have_content "This username or email has already been used"
  end
end