feature 'Branding' do
  scenario 'Shows chitter name' do
    visit('/')
    expect(page).to have_content 'chitter'
  end
end
