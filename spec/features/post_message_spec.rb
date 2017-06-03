feature 'user can post a message (peep) to chitter' do
  scenario 'user visits a message board' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
