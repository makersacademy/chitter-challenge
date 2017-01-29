feature 'user' do
  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  scenario 'signing up' do
    expect { signup }.to change(User, :count).by(1)
    expect(page).to have_current_path('/')
    expect(page).to have_content("Welcome, jonodoe")
  end

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to log in to Chitter
  scenario 'log in' do

  end


  # As a Maker
  # So that I can avoid others posting messages on Chitter as me
  # I want to log out of Chitter
  scenario 'log out' do

  end


end
