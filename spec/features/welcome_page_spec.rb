feature ChitterController do
  scenario 'see index page' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
