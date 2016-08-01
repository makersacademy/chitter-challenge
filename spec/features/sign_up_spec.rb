feature 'Sign up' do

  scenario 'a visitor can sign up' do
    sign_up
    expect(page).to have_content 'Welcome, nomi811'
  end
  scenario 'User cannot sign up if the confirmed password does not match' do
    expect{ sign_up(confirm_password: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "user cannot sign-up with a blank email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "user can't sign-up with an invalid email address" do
    expect { sign_up(email: 'invalid@gmail')}.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'user cannot sign-up with an already registered email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
