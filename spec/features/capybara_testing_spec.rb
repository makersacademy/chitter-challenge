feature 'capybara/sinatra are working' do
  scenario 'checking if feature tests can run' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end
end
