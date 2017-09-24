feature 'User sign in' do
  let!(:user) do
    User.create(username: 'Hoss',
                real_name: 'Harry Blackstone Copperfield Dresden',
                email_address: 'HarryBCDresden@aol.com',
                password: 'hunter2')
  end

  scenario 'with correct credentials' do
    sign_up
    expect(page).to have_content "Welcome to the peepline, #{user.real_name}"
    expect(page).to_not have_content('Goodbye!')
  end
end

feature 'User signs out' do
  before(:each) do
    User.create(email_address: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in(email_address: 'test@test.com', password: 'test')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end
