feature 'Add peep' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
    fill_in('peep', with: 'I am feeling ok')
    click_button('Post')
    expect(page).to have_content 'I am feeling ok'
  end
end
