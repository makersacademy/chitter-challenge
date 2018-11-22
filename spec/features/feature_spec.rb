feature 'Peeps' do
  scenario 'A user can view a peep' do
    visit('/')
    expect(page).to have_content "Hello, this is my first peep"
  end

  scenario 'Adding a peep' do
    visit('/peeps')
    fill_in('content', with: 'This is my second peep')
    click_button('Submit')
    expect(page).to have_content "This is my second peep"
  end
end
