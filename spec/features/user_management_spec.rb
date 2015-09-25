feature 'User sign up' do

  scenario 'I can sign up as a new user to chitter' do
    user = User.new(email: 'rich@gmail.com',
                    user_name: 'rich',
                    password: '12345',
                    password_confirmation: '12345')
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, rich@gmail.com')
    expect(User.first.email).to eq('rich@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    user = User.new(password_confirmation: 'wrong',
                    email: 'rich@gmail.com',
                    user_name: 'rich',
                    password: '12345',
                    password_confirmation: '12345')
    expect { sign_up(user) }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    user = User.new(email: 'rich@gmail.com',
                    user_name: 'rich',
                    password: '12345',
                    password_confirmation: '1')
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I can not sign up with an existing email' do
    user = User.new(email: 'rich@gmail.com',
                    user_name: 'rich',
                    password: '12345',
                    password_confirmation: '12345')
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end
end

feature 'User sign in' do

  let(:user) do
    User.create(email: 'rich@gmail.com',
                user_name: 'rich',
                password: '12345',
                password_confirmation: '12345')
  end

  scenario 'with correct credentials' do
    sign_in(user)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end