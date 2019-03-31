feature 'user can post message and see it on the site' do
  scenario 'user can input message on form and post it' do
    add_cheep('Test Post')
    expect(page).to have_content 'Test Post'
  end
end
