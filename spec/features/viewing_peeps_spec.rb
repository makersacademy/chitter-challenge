feature 'Home page' do
  scenario 'a logged out user can see recent peeps' do
    visit '/'
    expect(page).to have_content("Recent peeps")
  end
end
