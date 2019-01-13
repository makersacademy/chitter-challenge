require_relative 'web_helper'

feature 'A user can log out' do
  scenario 'A logged in user can log out' do
    sign_up
    click_on 'Log Out'

    expect(page.current_path).to eql '/'
  end
end
