feature 'Signing out' do
  scenario 'A user can sign out' do
    sign_up
    sign_in
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome to Chitter, George'
    click_button 'Sign Out'
    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content 'Welcome to Chitter, George'
    expect(page).to have_content 'Goodbye!'
  end
end
