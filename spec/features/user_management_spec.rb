feature 'User\'s' do

  let(:user) do
    build(:user)
  end

  scenario 'can sign up' do
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content("#{user.username}")
    expect(User.first.username).to eq("#{user.username}")
  end

  scenario 'requires a matching confirmation password when signing up' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'must enter an email address and username when signing up' do
    visit '/users/new'
    fill_in :password, with: 'hello'
    fill_in :password_confirmation, with: 'hello'
    click_button 'Sign up'
    expect(current_path).to eq('/users')
    expect(page).to have_content 'must not be blank'
  end

  scenario 'cannot sign up with an existing email' do
    sign_up(user)
    expect(page.status_code).to eq(200)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'cannot sign up with an existing username' do
    sign_up(user)
    expect(page.status_code).to eq(200)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Username is already taken')
  end
end

feature 'User\'s' do

  let(:user) do
    create(:user)
  end

  scenario 'can log in with correct credentials' do
    log_in(user)
    expect(page).to have_content "#{user.username}"
  end
end