feature 'it outputs the content' do
  scenario 'the page displays the content from the database' do
    visit '/'
    expect(page).to have_content('Post: This is a test message! From: Luke')
  end
end
