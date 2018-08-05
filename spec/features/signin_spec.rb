feature 'check login functions' do
  scenario 'check welcome page' do
    visit ('/')
    expect(page).to have_content "Welcome to chitter!"
  end

  scenario 'click submit after entering username' do
    visit ('/')
    fill_in('username', with: 'eddyt993')
    click_button 'Submit'

    expect(page).to have_content "Signed in as @eddyt993"
  end
end
