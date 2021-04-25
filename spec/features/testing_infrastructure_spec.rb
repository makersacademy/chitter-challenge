feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    p 'pre visit'
    visit('/')
    p 'after visit'
    expect(page).to have_content 'Testing infrastructure working!'
  end
end
