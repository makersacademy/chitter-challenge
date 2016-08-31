feature 'Sign up' do
  
  scenario "User can sign up for an account" do
    expect { sign_up_correctly }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome, Lexi"
  end

  scenario 'checks mismatching password' do
    expect { sign_up_incorrectly }.not_to change(User, :count)
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'stays on page when password mismatch' do
    expect { sign_up_incorrectly }.not_to change(User, :count)
    expect(page).to have_current_path('/users')
  end

  scenario 'email presists after mismatch error' do
    sign_up_incorrectly
    expect(page).to have_current_path('/users')
    expect(page).to have_selector('input[value="Lexi"]')
    expect(page).to have_selector('input[value="lexiht"]')
    expect(page).to have_selector('input[value="hazukitran@gmail.com"]')
  end

  scenario "user can't sign up with blank email" do
    expect { sign_up_without_email }.not_to change(User, :count)
  end

  scenario "user can't sign up with invalid email" do
    expect { sign_up_invalid_email }.not_to change(User, :count)
  end

  scenario 'user cannot register with an already existing email' do
    sign_up_correctly
    expect { sign_up_correctly }.not_to change(User, :count)
    expect(page).to have_content "Email is already taken"
  end

  scenario 'user cannot register with an already existing username' do
    sign_up_correctly
    expect { sign_up_correctly }.not_to change(User, :count)
    expect(page).to have_content "Username is already taken"
  end

end