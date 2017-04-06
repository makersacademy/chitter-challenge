feature 'Sign up for Chitter' do
  scenario 'To post user must sign up' do
    visit '/peeps'
    fill_in :email, with: 'ruan@email.com'
    fill_in :password, with: 's3cr3t'
    fill_in :name, with: 'Ruan'
    fill_in :user_name, with: 'ruan'
    click_button 'Sign up'
    expect(page).to have_content 'Success, you have been registered'

# fix this test !!
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('This is Zombocom')
  end
end
