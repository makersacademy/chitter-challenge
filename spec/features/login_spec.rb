require_relative 'web_helpers'

feature 'Log in' do
  scenario 'test login works, redirects to /peeps' do
    log_in_test
    expect(page).to have_content "Chitter - Get your Daily Peeps"
  end
end