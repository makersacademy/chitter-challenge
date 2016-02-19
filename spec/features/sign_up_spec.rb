feature 'Signing up' do
  scenario 'I can sign up for an account' do
    visit '/sign_up'
    expect(page.status_code).to eq 200
    sign_up
    expect(User.first.name).to eq 'Sample'
    expect(page).to have_content('sample1234')
  end

  scenario 'requires a confirmation password' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/new_user')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'require an email address' do
    expect{sign_up(email: nil)}.not_to change(User, :count)
  end

  scenario 'require a VALID email address' do
    expect{ sign_up(email: "invalid@email")}.not_to change(User, :count)
  end

  scenario 'can\'t sign up with an existing email' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'can\'t sign up with an existing username' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content('Username is already taken')
  end
end
