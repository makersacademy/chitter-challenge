feature 'Email validation' do
  scenario 'A blank email address cannot be entered' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'An invalid email address cannot be entered' do
    expect{ sign_up(email: 'robin@example') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'Duplicate email' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
