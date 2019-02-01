require_relative 'web_helpers'

feature 'posting message' do
  scenario 'user has signed up' do
    sign_up
    make_a_peep("My first Peep!")
    expect(page).not_to have_content("Sign up")
    expect(page).to have_content("My first Peep!")
  end
end
