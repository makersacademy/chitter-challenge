
feature 'Adding a new text' do
  scenario 'A user can post a new text to Chitter' do
    visit('/peeps/new')
    fill_in('text', with: 'Hello world')
    click_button('Submit')
     expect(page).to have_content 'Hello world'
  end
end
