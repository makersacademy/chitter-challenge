feature 'Welcome message' do
  scenario 'I can see a welcome message on the homepage' do
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome to Chitter!')
    end
  end
