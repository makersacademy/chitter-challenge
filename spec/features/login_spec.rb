require 'spec_helper'

feature 'user login' do

  scenario 'user visits homepage and logs in' do
    log_in("sar@sara.com", "cheese")
    expect(page).to have_content 'Welcome Sara!'
  end

  scenario 'user logs in with unfound details' do
    log_in("sam@sammy.com", "cherios")
    expect(page).to have_content 'Email or password not found'
  end

end
