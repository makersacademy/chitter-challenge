require_relative 'web_helpers'

feature 'registration' do
  scenario 'a user can sign up' do
    sign_in
    expect(page).to have_content "Fowwest"
  end
end
