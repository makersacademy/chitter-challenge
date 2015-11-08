feature 'Posting Peeps' do
  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234',
                name: 'user',
                user_name: 'user1')
  end

  scenario 'when user logged in' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
    visit '/peeps/new'
    fill_in 'message', with: 'This is a new peep'
    click_button 'Submit'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('This is a new peep')
  end

  scenario 'when user not logged in' do
    visit '/peeps/new'
    expect(page).to have_content('User not logged in')
  end
end