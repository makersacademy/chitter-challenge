feature 'Allows user' do
  scenario 'to view comments on index page' do
    visit '/'
    expect(page).to have_content 'Post a comment'
  end
end