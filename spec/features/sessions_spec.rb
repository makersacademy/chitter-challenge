feature 'User Sign-in' do
  before do #(:each) do
    User.create(name:                   'Another test',
                email:                  'test@test.com',
                username:               'test',
                password:               'test',
                password_confirmation:  'test')
  end

  scenario 'allows a user to sign in' do
    sign_in
    expect(page).to have_content 'Hi, test'
  end

  scenario 'displays sign-in error for wrong password' do
    sign_in(email: 'test@test.com', password: 'nottest', click: true)
    expect(page).not_to have_content 'Hi, test'
    expect(page).to have_content 'User email or password is incorrect'
  end

  scenario 'displays sign-in error for invalid email' do
    sign_in(email: 'nottest@test.com', password: 'test', click: true)
    expect(page).not_to have_content 'Hi, test'
    expect(page).to have_content 'User email or password is incorrect'
  end
end

feature 'User Sign Out' do
  before do #(:each) do
    User.create(name:                   'Another test',
                email:                  'test@test.com',
                username:               'test',
                password:               'test',
                password_confirmation:  'test')
    sign_in
  end

  scenario 'allows user to sign out' do
    sign_out
    expect(page).to have_content('Farewell!')
    expect(page).not_to have_content('Hi, test')
  end
end
