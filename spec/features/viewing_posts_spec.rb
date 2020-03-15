feature 'viewing posts' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Posts"
  end
end