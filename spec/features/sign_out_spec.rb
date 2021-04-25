require_relative './web_helper'

feature 'sign out' do
  scenario 'Once signed in, the sign out button replaces sign in' do
    visit '/'
    sign_up_and_submit
    sign_in
    expect(page).to have_button 'Sign out'
    expect(page).not_to have_button 'Sign in'
    expect(page).not_to have_button 'Sign up'
  end

  scenario 'Clicking sign out button signs you out' do
    visit '/'
    sign_up_and_submit
    sign_in
    click_button 'Sign out'
    expect(page).not_to have_button 'Sign out'
    expect(page).to have_button 'Sign in'
    expect(page).to have_button 'Sign up'
  end
end
