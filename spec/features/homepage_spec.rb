feature 'Testing infrastructure' do
  scenario 'Homepage contains text' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end