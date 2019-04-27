feature 'test infrastructure' do
  scenario 'go to home page' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end
end
