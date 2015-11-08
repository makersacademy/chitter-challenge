require 'web_helpers'

feature 'password cheker' do
  scenario 'throws an error with different passwords' do
    sign_up(p2: 'obbbb')
    expect(page).to have_content("Passwords must match")
  end
end
