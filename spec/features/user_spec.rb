feature 'user' do
  scenario 'user can sign in' do
    visit '/'
    fill_in :name, with: 'Flooba'
    fill_in :email, with: 'flooba@floobs.com'
    fill_in :password, with: 'supersecretfloobs'
    click_button 'Submit'
    expect(page).to have_content 'Welcome Flooba'
  end
end
