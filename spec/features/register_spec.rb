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
end
