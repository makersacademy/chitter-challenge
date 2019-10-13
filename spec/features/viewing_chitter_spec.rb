feature 'Viewing chitter' do
  scenario 'visiting the homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
