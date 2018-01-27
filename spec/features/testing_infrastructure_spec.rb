feature 'infrastructure test' do
  scenario 'Has welcome homepage' do
    visit('/peeps')
    expect(page).to have_content 'Welcome to Chitter'
  end
end
