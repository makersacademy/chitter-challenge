feature 'Branding' do
  scenario 'Shows Chitter name' do
    visit('/')
    expect(page).to have_content 'Chitter'
  end
end
