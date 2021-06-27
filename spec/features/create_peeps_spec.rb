feature 'Posting a new peep' do
  scenario 'A user posts a peep' do
    visit('/peeps/new')
    fill_in('peep', with: 'Hello World')
    fill_in('author', with: 'Test')
    click_button('Post')

    expect(page).to have_content 'Hello World'
    expect(page).to have_content 'Test'
  end
end
