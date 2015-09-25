feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  def sign_up(email: 'alice@example.com',
              password: 'oranges!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'alice@example.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up}.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  feature 'User sign in' do
    let(:user) do
      User.create(email: 'user@example.com',
                  password: 'secret1234',
                  password_confirmation: 'secret1234')
    end

    scenario 'with correct credentials' do
      sign_in(email: user.email,   password: user.password)
      expect(page).to have_content "Welcome, #{user.email}"
    end
  end

  feature 'User signs out' do

    let(:user) do
      User.create(email: 'test@example.com',
                  password: 'secret1234',
                  password_confirmation: 'secret1234')
  end

  scenario 'while being signed in' do
      sign_in(email: 'test@example.com', password: 'test')
      click_button 'Sign out'
      expect(page).to have_content('goodbye!')
      expect(page).not_to have_content('Welcome, test@example.com')
    end

  end
end
