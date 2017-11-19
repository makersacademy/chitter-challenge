def sign_up(email: 'tudor@yahoo.com', password: '12345678', password_confirmation: '12345678', name: "tudor", username: "tudorpp")
  visit('/users/new')
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  fill_in('name', with: name)
  fill_in('username', with: username)
  click_button('Sign up')
end
feature 'post peeps' do
  scenario 'adding a peep' do
    sign_up
    expect(current_path).to eq '/peeps'
    visit '/peeps/new'
    fill_in 'mess', with: 'Wow such a sunny day'
    click_button 'Add peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('Wow such a sunny day')
    end
  end
end
