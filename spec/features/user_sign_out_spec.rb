feature 'User can sign out of chitter' do
  scenario 'new user sign out' do
    sign_up
    click_button 'Sign out'
    expect(current_path).to eq '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Peep to you later!'
  end
  scenario 'old user sign out' do
    sign_in(user.email, user.password)
    click_button 'Sign out'
    expect(current_path).to eq '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Peep to you later!'
  end
end
