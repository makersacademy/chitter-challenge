feature 'Signing up as a user:' do

  scenario 'I can sign up as a new user' do
    user = build :user
    sign_up_as(user)
    expect(User.first.handle).to eq(user.handle)
  end

  scenario 'I am signed in once I\'ve signed up' do
    user = build :user
    sign_up_as(user)
    expect(page).to have_content("You are signed in as #{name_handle(user)}")
  end

end
