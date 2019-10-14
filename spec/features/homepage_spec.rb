feature 'Sinatra testing' do
  scenario 'see welcome to chitter message on homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
