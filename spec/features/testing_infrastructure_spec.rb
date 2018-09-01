feature 'Testing infrastructure' do
  scenario 'client can access route' do
    visit('/')
    expect(page).to have_content('Testing infrastructure')
  end
end
