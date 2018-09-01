feature 'viewing chitter' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content 'welcome to chitter'
  end

  scenario 'can view a list of chits' do
    post_chits
    expect(page).to have_content 'hey!'
    expect(page).to have_content 'bye!'
  end
end
