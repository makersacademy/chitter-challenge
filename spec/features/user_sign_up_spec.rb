feature 'User Sign up' do
  scenario  'User can sign up' do
    sign_up
    expect(current_path).to eq '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome, John Doe')
    expect { sign_up }.to change { User.count }.by 1
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
end
