feature 'Log in' do
  let!(:user) do
    User.create(name: 'name',
            username: 'user',
               email: 'email@example.com',
            password: 'password')
  end

  scenario 'with correct details' do
    log_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  def log_in(email:, password:)
    visit('/sessions/new')
    expect(page.status_code).to eq 200
    fill_in(:email, with: email)
    fill_in(:password, with: password)
    click_button("Log in")
  end
end
