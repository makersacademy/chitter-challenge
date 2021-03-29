feature "New Peep" do
  scenario "User can write a new Peep and post it" do
    visit '/'
    click_on('New Peep')
    fill_in('content', with: 'Blah blah blah')
    click_on('Post')
  end

  scenario "Posting redirects user to index page" do
    visit '/'
    click_on('New Peep')
    fill_in('content', with: 'Blah blah blah')
    click_on('Post')
    expect(page).to have_content('Welcome to Chitter!')
  end
end
