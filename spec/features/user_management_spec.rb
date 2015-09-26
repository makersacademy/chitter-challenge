
feature 'user up' do
  scenario 'I can sign up as a new user to Chitter' do
    user = build :user
    sign_up(user)
    expect(page).to have_content("Welcome, #{user.email}")
  end




end
