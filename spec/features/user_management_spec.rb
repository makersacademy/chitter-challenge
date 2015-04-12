require 'user'

feature "User signs up" do

  scenario 'When being a new user visiting the site' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('alice@example.com')
  end

  def sign_up(email = 'alice@example.com',
              password = 'oranges!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end
end