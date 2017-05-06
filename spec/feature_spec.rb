feature 'homepage' do

  scenario 'land on homepage' do
    DatabaseCleaner.clean
    visit '/'
    expect(page).to have_content 'chitter'
  end
end
