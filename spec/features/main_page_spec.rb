feature 'Redirects to feed/index' do
  scenario 'User is directed to index when visiting site' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
