require 'spec_helper'

feature 'user registration' do

  scenario 'user visits homepage and registers' do
    register("Sally")
    expect(page).to have_content 'Welcome Sally!'
  end


end
