feature 'create a peep' do
  scenario 'it creates a peep' do
    visit('/')
    fill_in(name: 'posts', with: 'Hello world')
    click_button('Submit')
    expect(page).to have_content 'Hello world'
  end
end