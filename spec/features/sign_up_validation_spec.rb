feature 'Validation of signup fields' do
  scenario 'blank email raises error' do
    sign_up(email: '')
    expect(User.all.count).to eq 0
    expect(page).to have_content('Please enter an email address')
  end

  scenario 'blank username raises error' do
    sign_up(username: '')
    expect(User.all.count).to eq 0
    expect(page).to have_content('Please enter a username')
  end

  scenario 'blank name raises error' do
    sign_up(name: '')
    expect(User.all.count).to eq 0
    expect(page).to have_content('Please enter your name')
  end

  scenario 'blank matching password raises error' do
    sign_up(password: '',password_confirmation: '')
    expect(User.all.count).to eq 0
    expect(page).to have_content('Password must be at least 4 characters long')
  end

  scenario 'mismatched password raises error' do
    sign_up(password_confirmation: 'bollocks')
    expect(User.all.count).to eq 0
    expect(page).to have_content('Password and confirmation password do not match')
  end

  scenario 'invalid email raises error' do
    sign_up(email: 'crap')
    expect(User.all.count).to eq 0
    expect(page).to have_content('Please enter a valid email address')
  end

  scenario 'Duplicate user registration' do
    sign_up
    sign_up
    expect(User.all.count).to eq 1
    expect(page).to have_content('This user already exists')
  end
end
