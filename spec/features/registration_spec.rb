require 'spec_helper'

feature 'user registration' do

  scenario 'user can visit homepage and register' do
    register("sals","sally@sal.com")
    expect(page).to have_content 'Welcome Someone!'
  end



end
