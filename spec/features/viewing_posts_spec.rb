feature 'Viewing posts' do
  scenario 'User can see posts' do
    visit('/posts')

    expect(page).to have_content "this is a test"
    expect(page).to have_content "this is also a test"
  end
end
