require 'spec_helper'

feature 'User signs out' do

  before(:each) do
    User.create(:email => 'becca@becca.com',
                :name => 'Becca',
                :username => 'pregnantwombat',
                :password => 'haircut',
                :password_confirmation => 'haircut')
  end

  scenario 'while being signed in' do
    sign_in
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome Becca')
  end

end
