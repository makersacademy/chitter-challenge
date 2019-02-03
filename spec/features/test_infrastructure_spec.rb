require 'spec_helper'
# require_relative 'web_helpers.rb'

feature 'Homepage' do
  let(:email)       {'email@email.com'}
  let(:username)    {'Bey_Knowles123'}
  let(:first_name)  {'Beyoncé'}
  let(:last_name)   {'Knowles'}
  let(:password)    {'password123'}

  scenario 'User is welcomed on homepage' do
    visit '/'
    welcome = 'Welcome to Shitter!'
    expect(page).to have_content(welcome)
  end

  scenario 'User can sign up on the homepage' do
    visit '/'
    fill_in_sign_up_form
    expect {page.find('body', text: "What would you like to share, username")}.to_not raise_error
  end

end

feature 'Peeps display page' do

  # scenario 'User can only post a peep if signed in' do
  #
  # end

  scenario 'User can post a peep' do
    visit '/'
    fill_in_sign_up_form
    post_a_peep
    expect(page).to have_content("This is a test peep!")
  end

  scenario 'Page shows the time each peep was created' do
    visit '/'
    fill_in_sign_up_form
    post_a_peep
    peep = Peep.all[0]
    expect(page).to have_css('#print-peeps')
  end

  scenario 'Page shows the user who created the peep' do
    visit '/'
    fill_in_sign_up_form
    post_a_peep
    peep = Peep.all[0]
    expect {page.find('div', text: "This is a test peep!\n-- username")}.to_not raise_error
  end

end
