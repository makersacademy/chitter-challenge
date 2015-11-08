feature 'Register' do
  scenario 'can be taken through to register a new account from root' do
    visit '/'
    click_button('Register')
    expect(current_path).to eq '/users/register'
    expect(page).to have_content('Please register')
  end

  scenario 'enter no details' do
    visit '/'
    click_button('Register')
    click_button('Submit')
    expect(page).to have_content('Username must not be blank')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'enter valid details' do
    register
    expect(User.count).to eq 1
    expect(page).to have_content("Welcome, andy")
  end

  scenario 'enter duplicate valid details' do
    2.times do
      register
    end
    expect(page).to have_content('Email is already taken')
    expect(page).to have_content('Username is already taken')
    expect(User.count).to eq 1
    expect(current_path).to eq '/users/register'
  end
end