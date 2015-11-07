feature 'Register' do
  scenario 'can be taken through to register a new account' do
    visit '/'
    click_button('Register')
    expect(current_path).to eq '/users/register'
    expect(page).to have_content('Please register')
  end

  scenario 'enter details' do
    visit '/users/register'
    fill_in(:email, with: 'andy@andy.com')
    fill_in(:name, with: 'andy')
    fill_in(:username, with: 'k0zakinio')
    fill_in(:password, with: '4ndyDragon')
    click_button('Register')
    expect(User.count).to eq 1
  end

  scenario 'already registered email' do
    2.times do
      visit '/users/register'
      fill_in(:email, with: 'andy@andy.com')
      fill_in(:name, with: 'andy')
      fill_in(:username, with: 'k0zakinio')
      fill_in(:password, with: '4ndyDragon')
      click_button('Register')
    end
    expect(page).to have_content('Email already registered')
    expect(User.count).to eq 1
  end
end