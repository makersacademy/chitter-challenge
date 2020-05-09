feature 'Add peep' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
    fill_in('peep', with: 'hello')
  end
end
