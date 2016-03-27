feature 'User Sign up' do
  scenario 'User can sign up' do
    sign_up
    expect(current_path).to eq '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome, John Doe')
    expect(User.count).to eq 1
  end

  scenario 'Cannot sign up when password is not matching' do
    expect { sign_up_pw_mismatch }.to change { User.count }.by 0
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'Cannot sign up when email format is correct' do
    expect { sign_up_invalid_email }.to change { User.count }.by 0
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'Cannot sign up when email or name is missing' do
    expect { sign_up_no_email_or_name }.to change { User.count }.by 0
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'Cannot sign up when email is taken' do
    User.create(name:'John Doe',
          username: 'john123',
          email: 'me@email.com',
          password:'asd123',
          password_confirmation:'asd123')
    sign_up
    expect { sign_up_registered_email_or_username }.to change { User.count }.by 0
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content 'Email is already taken'
    expect(page).to have_content 'Username is already taken'
  end
end
