feature 'home page' do

  scenario 'I can navigate to home page' do
    visit '/'
    expect(page.status_code).to eql(200)
  end
end

feature 'sign up as user' do

  scenario 'I can register as a user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'requires a matching confirmation password' do
    expect {sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(name: 'alice',
              email: 'alice@example.com',
              password: 'oranges',
              password_confirmation: 'oranges')

      visit '/users/new'
      expect(page.status_code).to eql(200)
      fill_in :name,                  with: name
      fill_in :email,                 with: email
      fill_in :password,              with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign up'
  end

end
