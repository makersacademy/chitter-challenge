
feature 'User sign up' do

  scenario 'user can sign up as new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, reena@example.com'
    expect(User.first.email).to eq 'reena@example.com'
  end

  scenario 'where password does not match' do
    expect { sign_up(password_confirmation: 'password') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'user cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario "user can't sign up with a blank email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "user can't sign up with invalid email format" do
    expect { sign_up(email: 'reena@example') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email has an invalid format'
  end
end
