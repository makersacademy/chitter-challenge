require_relative './web_helper.rb'

feature 'sign in' do
  scenario 'signing in sets session[:user]' do
    visit '/'
    click_button 'Sign up'
    sign_up_and_submit
    sign_in
    expect(page).to have_content 'Signed in as Kane'
  end

  # scenario 'Once signed in, the sign out button replaces sign in' do
  #   visit '/'
  #   click_button 'Sign up'
  #   sign_up_and_submit
  #   sign_in
  # end
end
