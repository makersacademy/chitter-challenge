feature 'Welcome on the homepage' do 
  scenario 'User visits the homepage and gets a message saying they are on Chitter' do 
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end
end
