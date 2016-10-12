require './spec/spec_helper'

feature 'User sign out' do
  scenario 'I can sign out' do
    sign_up
    sign_in(email: 'user@email.com', password: 'Password123')
    sign_out

    expect(current_path).to eq('/sessions/new')
    expect(page).to have_content("goodbye!")
    expect(page).not_to have_content("Welcome, user@email.com")
  end
end
