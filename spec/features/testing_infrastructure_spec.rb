feature 'Testing infrastructure' do
  scenario 'accessing index page' do
    visit ('/')
    expect(page).to have_content 'Chitter'
  end
end
