feature 'Sign up for Chitter' do
  scenario 'To post user must sign up' do
    expect { sign_up }.to change(User, :count).by 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, Ruan'
  end

  scenario 'user enters incorrect password confirmation' do
    expect { sign_up(password_confirmation: 'incorrect') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'do not enter email' do
    visit '/users/new'
    fill_in 'password', with: 's3cr3t'
    fill_in 'password_confirmation', with: 's3cr3t'
    expect(current_path).to eq '/users/new'
    click_button 'Sign up'
    expect(page).to have_content('Email must not be blank')
    expect(User.count).to eq 0
  end

  scenario 'enter invalid email' do
    visit '/users/new'
    fill_in 'email', with: 'hi'
    fill_in 'password', with: 's3cr3t'
    fill_in 'password_confirmation', with: 's3cr3t'
    expect(current_path).to eq '/users/new'
    click_button 'Sign up'
    expect(page).to have_content('Email has an invalid format')
    expect(User.count).to eq 0
  end
end
