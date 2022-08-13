
feature 'infrastructure test' do
  scenario 'Testing website' do
    visit('/')
    expect(page).to have_content 'Chitter'
  end
end
