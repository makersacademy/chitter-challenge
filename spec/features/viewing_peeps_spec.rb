feature 'Testing the infrastructure of our app' do
  scenario 'Testing the user can see Welcome to Chitter on the homepage' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter!'
  end
end

feature 'User views all of their peeps' do
  scenario 'user can views their peeps' do
    visit('/')
    click_button('My Peeps')
    expect(page).to have_content('Hello, Twitter!')
  end
end
