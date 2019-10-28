
feature 'Index' do
  scenario 'user can load the index' do
    visit '/'
    expect(page).to have_content 'chitter'
  end
end
