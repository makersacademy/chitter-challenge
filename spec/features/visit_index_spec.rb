feature 'Index page' do
  scenario 'Visit index page - see tagline' do
    visit '/'
    expect(page).to have_content('Chitter - Speak Your Mind')
  end
end
