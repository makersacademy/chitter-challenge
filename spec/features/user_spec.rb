feature 'viewing index page' do
  scenario 'there are no users to see' do
    visit('/users')

    expect(page).to have_content 'No users.'
    expect(page).to have_link('Add user')
  end
end
