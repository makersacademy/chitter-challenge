feature 'Sign up for Chitter' do
  scenario 'user can sign up from homepage' do
    visit '/peeps'
    expect(page).to have_selector(:link_or_button, 'Join')
  end

  scenario 'To post user must sign up' do
    expect { sign_up }.to change(User, :count).by 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "Welcome, ruanodendaal"
  end

  scenario 'user enters incorrect password confirmation' do
    expect { sign_up(password_confirmation: 'incorrect') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'do not enter email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'enter invalid email' do
    expect { sign_up(email: 'invalid.com') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email has an invalid format')
    expect(User.count).to eq 0
  end
end
