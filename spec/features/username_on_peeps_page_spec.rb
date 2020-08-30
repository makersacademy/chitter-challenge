feature 'username display' do
  scenario 'username is displayed on top of peeps page' do
    visit '/'
    fill_in :username, with: 'Homer'
    click_button 'Create account'
    expect(page).to have_content 'Homer'
  end
end
