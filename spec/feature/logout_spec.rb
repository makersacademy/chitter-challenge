feature "the user can logout" do

   let!(:user) do
    User.create(email: 'user@example.com',
      password: '12345',
      name: 'Bobby',
      username: 'B123')
    end

  scenario 'on clicking the logout button' do
    visit('/sessions/new')
    sign_in(username: user.username, password: user.password)
    click_button('Logout')
    expect(page).to have_content "Welcome to Chitter!"

  end


end

 def sign_in(username:, password:)
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Sign in'
end