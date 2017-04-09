require_relative 'web_helpers'

feature "Sign-In Functionality" do

  let(:email)     { "rick@gmail.com" }
  let(:username)  { "rickroll" }
  let(:password)  { "nggyu"}
  let(:name)      { "Rick Astley" }

  let(:sign_in_params)  {
    {
      name:     name,
      username: username,
      password: password,
      email:    email,
      password_confirmation: password,
    }
  }

  scenario 'existing user signs in successfully on sign in page' do
    create_user(sign_in_params)
    visit '/sessions/new'
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button 'Sign In'
    expect(page).to have_content(email)
  end

  scenario "non-existing user can't sign in" do
    visit'/sessions/new'
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button 'Sign In'
    expect(page).not_to have_content(email)
    expect(page).to have_content("The email or password is incorrect")
  end



end
