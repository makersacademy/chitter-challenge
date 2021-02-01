require_relative './web_helpers.rb'

feature 'sign out' do
  scenario 'a user can sign out' do
    sign_up_and_log_in

    expect(current_path).to eq '/chitter'
    click_button("Sign Out")
    expect(current_path).to eq '/homepage'
    expect(page).to have_content("Welcome to Chitter")
  end
end
