feature 'Landing page' do
  scenario 'I see a landing page' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
