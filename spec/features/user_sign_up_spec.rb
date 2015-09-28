feature 'Signing up as a user:' do

  scenario 'I can sign up as a new user' do
    user = build :user
    sign_up_as(user)
    expect(User.first.handle).to eq(user.handle)
  end

  scenario 'I get confirmation that I\'ve signed in' do
    user = build :user
    sign_up_as(user)
    expect(page).to have_content("You are logged in as #{name_handle(user)}")
  end

end
