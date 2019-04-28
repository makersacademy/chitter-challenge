feature 'add peeps to chitter' do
  scenario 'user adds a peep' do
    visit '/home'
    click_button 'New Peep'
    fill_in 'post', with: "Hello, chitter!"
    click_button 'Post'
    expect(page).to have_content "Hello, chitter!"
  end
end
