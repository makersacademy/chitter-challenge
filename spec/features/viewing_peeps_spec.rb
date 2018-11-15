require_relative 'web_helpers'

feature 'Viewing peeps' do
  # as a social media user
  # so i can see the chitter feed
  # i want to be able to view the chitter peeps in reverse chronological order
  scenario 'A user can see the peeps' do
    user = User.create(email: 'test@example.com', password: 'password123')
    visit('/')
    click_button('Sign in')
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    Peep.create(text: 'the sky is blue', user_id: user.id)
    Peep.create(text: 'the sea is green', user_id: user.id)
    Peep.create(text: 'fire is red', user_id: user.id)
    
    visit('/peeps')

    expect(page).to have_content("the sky is blue")
    expect(page).to have_content("the sea is green")
    expect(page).to have_content("fire is red")
  end
end
