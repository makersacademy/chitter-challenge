feature 'it has a home page' do
  scenario 'has a home route' do
    visit('/')
    expect(page).to have_content 'Chitter'
  end
end
