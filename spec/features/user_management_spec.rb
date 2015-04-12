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
  
  scenario 'with a password that does not match' do
    expect { sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
  end

  def sign_up(email = 'alice@example.com',
              password = 'oranges!',
              password_confirmation = 'oranges!')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by(1)
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end
end