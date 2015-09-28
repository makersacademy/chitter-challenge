

feature 'sign up as user' do

  before do
    @user = build(:user)
  end

  scenario 'I can register as a user' do
    expect { sign_up(@user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, moe@example.com')
    expect(User.first.email).to eq('moe@example.com')
  end


  scenario 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing email' do
    user = build(:user, username: 'notmoe')
    sign_up(@user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email is already taken')
  end


end
