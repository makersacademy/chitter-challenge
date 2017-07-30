feature 'able to sign up' do

  scenario 'visit website' do
    visit('/')
    expect(page).to have_content('Join Pipper today')
  end

  scenario 'signed up' do
    visit('/')
    sign_up('user', 'user@gmail.com', '1234', '1234')
    expect(page).to have_content('Welcome')
  end

  scenario 'signed up with mismatching password' do
    visit('/')
    sign_up('user', 'user@gmail.com', '1234', '1233')
    expect(page).to have_content('Join Pipper today')
  end

  scenario 'signed up without email' do
    visit('/')
    sign_up('user', '', '1234', '1233')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'signed up twice with same input' do
    visit('/')
    sign_up('user', 'user@gmail.com', '1234', '1234')
    visit('/')
    sign_up('user', 'user@gmail.com', '1234', '1234')
    expect(page).to have_content('Email is already taken')
  end
end
