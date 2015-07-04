# require './app/models/user'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect {sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, salman@test.com')
    expect(User.first.email).to eq('salman@example.com')
  end

  def sign_up(email: 'salman@test.com', password: 'oranges!')
    visit '/user/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end
end
