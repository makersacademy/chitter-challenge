feature 'Sign in' do
  let!(:user) do
    User.create(first_name: 'Annemarie', last_name: 'Kohler', username: 'Anne',
      email: 'anne@chittr.com', password: 'dog', password_confirmation: 'dog')
  end

  scenario 'user can go to sign in page' do
    visit '/'
    click_link 'Sign in'
    expect(current_path).to eq '/sessions/new'
  end

  scenario 'user can sign in with their username and password' do
    sign_in(email: user.email, password: user.password)
    expect(current_path).to eq '/'
    expect(page).to have_content('Welcome, Anne')
  end
end
