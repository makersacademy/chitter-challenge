 feature 'Register' do
  scenario 'users can sign up for a Chitter account' do
    visit('/')
    click_button 'sign up'
    expect(page).to have_field('name')
    expect(page).to have_field('email')
    expect(page).to have_field('username')
    expect(page).to have_field('psw')
    expect(page).to have_field('psw-repeat')
  end

  scenario 'providing details leads to a login page' do
    visit ('/')
    click_button 'sign up'
    fill_in 'name', with: 'Rick Vigorous'
    fill_in 'email', with: 'throwingbricks@yourhouse.com'
    fill_in 'username', with: 'RickV'
    fill_in 'psw', with: 'P@ssword1'
    fill_in 'psw-repeat', with: 'P@ssword1'
    click_button 'Sign Up'
    expect(current_path).to eq('/login')
  end
end
