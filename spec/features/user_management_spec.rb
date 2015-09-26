
feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    user = build :user
    expect { sign_up_as(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, yana')
    expect(User.first.user_name).to eq('yana')
  end

end

feature 'Log in' do

  scenario 'I can log in' do
    user = create :user
    sign_in_as(user)
    expect(page).to have_content("Welcome, #{user.user_name}")
  end

end