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
    visit '/sign-in'
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button 'Sign In'
    expect(current_path).to eq('/feed')
  end



end
