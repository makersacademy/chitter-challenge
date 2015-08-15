feature do
  let(:user) { user = build(:user) }

  scenario 'User can sign up' do
    sign_up(user)
    expect(current_path).to eq('/')
  end

  scenario 'User can log in after signing up' do
    sign_up(user)
    click_button('Log out')
    sign_in(user)
    expect(current_path).to eq('/')
    expect(page).to have_content("Welcome, #{user.user_name}!")
  end
end
