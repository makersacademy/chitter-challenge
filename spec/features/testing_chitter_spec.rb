feature 'Checking the homepage' do
  scenario 'holds the hello world' do
    visit('/')
    expect(page).to have_content('Hello World')
  end
end