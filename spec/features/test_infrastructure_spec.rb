feature 'test infrastructure' do
  scenario 'it makes sure the page runs' do
    visit('/')
    expect(page).to have_content 'OK LESSS GO'
  end
end