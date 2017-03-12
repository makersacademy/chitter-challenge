feature 'User sign in' do

  let!(:user) do
    User.create(username: 'example',
                name: 'example',
                email_address: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email_address: user.email_address, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'can post a peep' do
    visit('/peeps/new')
    fill_in 'peep', with: 'Testing peeps'
    click_button 'post peep'
    expect(page).to have_content 'Testing peeps'
  end
end
