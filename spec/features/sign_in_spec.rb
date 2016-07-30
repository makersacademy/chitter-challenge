require 'spec_helper'

feature 'sign_in' do

  let!(:user) do
    User.create(:email => 'becca@gmail.com',
                :name => 'Becca',
                :username => 'pregnantwombat',
                :password => 'haircut',
                :password_confirmation => 'haircut')
  end

  scenario 'user can sign in' do
    visit '/sessions/new'
    fill_in "email", :with => "becca@gmail.com"
    fill_in "password", :with => "haircut"
    click_button('Sign in')
    expect(page).to have_content "Welcome Becca"
  end

  scenario'user who has not signed up cannot sign in- incorrect email' do
    visit '/sessions/new'
    fill_in "email", :with => "rebecca@gmail.com"
    fill_in "password", :with => "haircut"
    click_button('Sign in')
    expect(page).to have_content "The email or password is incorrect"
  end
  scenario'user who has not signed up cannot sign in- incorrect password' do
    visit '/sessions/new'
    fill_in "email", :with => "becca@gmail.com"
    fill_in "password", :with => "shampoo"
    click_button('Sign in')
    expect(page).to have_content "The email or password is incorrect"
  end
end
