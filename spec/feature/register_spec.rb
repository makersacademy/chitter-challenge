feature 'register' do
  scenario 'Owen Farrel signs up to chitter' do
    visit('/')
    click_button('Sign Up')
    fill_in('Username', with: 'Owen_Farrel')
    fill_in('email', with: 'owenfarrel@gmail.com')
    fill_in('fname', with: 'Owen')
    fill_in('sname', with: 'Farrel')
    fill_in('password', with: 'password')
    click_button('Register')
    expect(page).to have_content('Username')
    expect(page).to have_content('Password')
  end
end
