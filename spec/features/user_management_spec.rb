feature 'User can sign up' do
  let(:user) { user = build(:user) }

  scenario 'User can sign up as a new user' do
    sign_up(user)
    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome, #{user.user_name}!")
  end
end

feature 'User can log in' do
  let(:user) { user = build(:user) }

  scenario 'User can log in after signing up' do
    user = create(:user)
    sign_in(user)
    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome, #{user.user_name}!")
  end
end
