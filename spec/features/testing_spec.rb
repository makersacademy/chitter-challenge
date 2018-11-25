feature 'testing' do
  scenario 'testing rspec and capybara' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
