feature 'Email validation' do
  scenario 'Blank email address validation' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'Wrong written email address' do
    expect{ sign_up(email: 'adaymesagc@gmail') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'Repeated email' do
    sign_up
    expect{sign_up}.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
