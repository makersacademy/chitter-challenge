feature 'user signup' do
  scenario 'user can access sign up form' do
    visit '/'
    click_on('Sign Up')
    expect(page).to have_content('Name')
    expect(page).to have_content('Username')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end

  scenario 'user completes sign up' do
    visit '/'
    click_on('Sign Up')
    fill_in 'name', with: 'Gram Parsons'
    fill_in 'username', with: 'flyingBurrito'
    fill_in 'email', with: 'cecil3@gmail.com'
    fill_in 'password', with: 'Emmylou123'
    expect{ click_on('Sign Up') }.to change{ User.all.length }.by(1)
  end
end
