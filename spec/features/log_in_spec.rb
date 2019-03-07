require_relative 'web_helper'

feature 'Users can login' do
  scenario 'A user can login to thier profile' do
    sign_up
    login

    expect(page).to have_content("Magnus")
    expect(page).to have_content("Magnus@1000sons.co.pr")
  end

  scenario 'A user is informed if their details are incorrect' do
    sign_up
    login_with_wrong_details
    expect(page).to have_content("Incorrect details")
  end
end
