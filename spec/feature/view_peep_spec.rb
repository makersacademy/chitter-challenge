feature 'content displayed' do
  scenario 'it displays a message' do
    visit '/chitter'
    expect(page).to have_content 'Welcome to Chitter Ver1'
  end
end
