feature 'Sign Up' do

  scenario 'displays welcome message when signing up' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, newbie')
    expect(User.first.email).to eq('newbie@gmail.com')
  end

  scenario 'requires matching confirmation password' do
    expect{ sign_up_fail(password_confirmation: 'wrong') }.not_to change( User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up without an email address' do
    expect{ sign_up_fail(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect{ sign_up_fail(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect{ sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end


end
