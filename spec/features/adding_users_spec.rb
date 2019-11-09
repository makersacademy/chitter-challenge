require_relative '../web_helpers'

feature 'adding users to Chitter' do
  scenario 'it adds a new user to Chitter' do
    sign_up
    expect(page).to have_content('ellieSMASH')
  end
end
