feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change{User.count}.by(1)
    expect(page).to have_content('Welcome, htunny!')
    expect(User.first.email).to eq('andy_htun@hotmail.com')
  end

  scenario 'no new user is created on mismatched password' do
    expect{sign_up(password_confirmation: 'Bananas')}.not_to change(User, :count)
  end

  scenario 'raises visible error when mismatched password' do
    visit '/users/new'
    expect(page).not_to have_content 'Password confirmation incorrect'
    sign_up(password_confirmation: 'Kittens')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Password confirmation incorrect'
  end

  scenario 'after mismatched password, email is persisted in form' do
    sign_up(password_confirmation: 'Kittens')
    expect(current_path).to eq '/users/new'
    expect(page).to have_selector("input[value='andy_htun@hotmail.com']")
  end

  scenario 'raises error if email format is wrong' do
    sign_up(email: '')
    expect(current_path).to eq '/users/new'
  end

  scenario 'fails if you sign up twice with same email' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email already registered'
  end
end
