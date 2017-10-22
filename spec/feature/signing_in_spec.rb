feature 'sign in' do
  let!(:maker) do
    Maker.create(email: 'olivia@example.com',
                 password: '12345678',
                 password_confirmation: '12345678')
  end

  scenario 'with correct credentials' do
    sign_in(email: maker.email,   password: maker.password)
    expect(page).to have_content "Welcome, #{maker.email}"
  end

end
