require 'spec_helper.rb'
require 'web_helper'

describe "Sign up" do
  feature "Displays sign up instructions" do
    scenario "Upon visit, promt user to input a name and password" do
    visit '/sign_up'
    expect(page).to have_content 'Please enter your details'
    end
  end

  feature "Contains email and password field" do
    scenario "User is greated with sign in form containing default suggestions" do
    visit '/sign_up'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Confirm Password'
    end
  end

  feature "Inputs details and submits form" do
    scenario "User is greated with fields and inputs their own credentials, submits" do
      sign_up
      visit '/'
      expect(page).to have_content 'Tweet'
    end
  end
end
