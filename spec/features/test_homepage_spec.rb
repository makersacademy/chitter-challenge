feature 'Testing infrastructure' do
  scenario 'visit index page' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end
end
