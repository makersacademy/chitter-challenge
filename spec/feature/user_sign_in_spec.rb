feature 'User sign in' do

  let!(:user) do
    User.create(email: 'user@example.com',
                name: 'Test Person',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "#{user.name}"
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In'
  end
end
