require_relative 'web_helpers'

feature 'Deleting peeps' do
  # as a social media user
  # so i can remove peeps from my peep feed
  # i want to delete a peep
  scenario 'A user can delete a peep' do
    user = User.create(email: 'test@example.com', password: 'password123')
    visit('/')
    click_button('Sign in')
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    Peep.create(text: 'apples are green!', user_id: user.id)
    
    visit('/peeps')
    expect(page).to have_content('apples are green')
    first('.peep').click_button('Delete')
    expect(current_path).to eq('/peeps')
    expect(page).not_to have_content('apples are green')
  end
end
