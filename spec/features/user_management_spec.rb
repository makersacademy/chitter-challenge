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

feature 'User can log out' do
  let(:user) { user = build(:user) }

  scenario 'while signed in' do
    user = create(:user)
    sign_in(user)
    click_button('Log out')
    expect(page).to have_content("Goodbye, #{user.user_name}!")
    expect(page).not_to have_content("Welcome, #{user.user_name}!")
  end
end
