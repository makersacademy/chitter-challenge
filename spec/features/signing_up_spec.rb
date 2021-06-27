feature 'signing up for Chitter' do 
  scenario 'visiting the sign up page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature 'Signing up for Chitter'do
  scenario 'A user can sign up to Chitter' do 
    sign_up
    expect(page).to have_content 'Welcome to Chitter, Jonny'
  end
end
