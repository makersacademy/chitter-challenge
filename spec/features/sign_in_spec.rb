# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "Sign up functionality" do

  let(:email)     { "rick@astley.com" }
  let(:username)  { "rickroll" }
  let(:password)  { "nggyu"}
  let(:name)      { "Rick Astley" }

  scenario "User goes to sign up page and signs in" do

    user_count = User.count

    visit '/sign-up'
    fill_in('email',    with: email)
    fill_in('username', with: username)
    fill_in('password', with: password)
    fill_in('name',     with: name)

    expect { click_button 'Sign Up' }.to change(User, :count).by(1)

  end

end
