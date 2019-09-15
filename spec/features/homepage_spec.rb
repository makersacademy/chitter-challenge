feature 'Homepage' do
  scenario 'displays welcome to the user' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
