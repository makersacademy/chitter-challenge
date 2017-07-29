feature 'Sign Up to Chitter' do

  scenario 'new user can sign up' do
    visit '/users/new'
    fill_in 'name', with: 'Dave Mittens'
    fill_in 'username', with: 'Cat_Peeps93'
    fill_in 'email', with: 'dave@gmail.com'
    click_button 'Sign Up!'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome Cat_Peeps93!'
  end

end
