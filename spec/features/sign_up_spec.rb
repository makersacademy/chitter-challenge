feature 'Sign up' do
  scenario 'when submitting the sign up form' do
    sign_up
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome, kyaw')
  end

  scenario 'it creates the user account' do
    sign_up
    expect(User.first.email).to eq('kyaw@gmail.com')
    expect(User.all.size).to eq 1
  end

  scenario 'requires a matching confirmation password' do
    sign_up(password_confirmation: '4321')
    expect(User.all.size).to eq 0
  end

  scenario 'shows the error message when passwords do not match' do
    sign_up(password_confirmation: '4321')
    expect(page).to have_content('Passwords do not match')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect {sign_up}.to_not change(User, :count)
    # expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up without an email address' do
    expect {sign_up(email: nil)}.not_to change(User, :count)
    # expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalid email address' do
  expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  # expect(page).to have_content('Email has an invalid format')
end


end
