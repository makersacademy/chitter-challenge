feature 'index' do
  scenario 'prints out the greeting title' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
