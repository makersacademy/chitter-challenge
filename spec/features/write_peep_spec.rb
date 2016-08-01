require 'spec_helper'

feature 'writing peeps' do
  let!(:user) do
    User.create(email: 'becca@becca.com',
                name: 'Becca',
                username: 'pregnantwombat',
                password: 'haircut',
                password_confirmation: 'haircut')
  end

  scenario 'a user can see the peep form' do
    sign_in
    expect(page).to have_button("Send a peep")
  end
  scenario 'a guest cannot write a peep' do
    expect(page).to_not have_button("Send a peep")
  end
  scenario 'a user can write a peep' do
    sign_in
    visit '/peep/new'
    expect(page).to have_content("What would you like to peep about?")
  end
  scenario 'a guest cannot write a peep' do
    visit '/peep/new'
    expect(page).to have_content("You need to sign up before you can send peeps")
    click_button'Sign up'
    expect(current_path).to eq '/user/new'
  end
  scenario 'a user can publish a peep to the list' do
    sign_in
    visit '/peep/new'
    fill_in "peep", with: "#fun at the fair"
    click_button"Send peep"
    expect(current_path).to eq '/peep/index'
    expect(page).to have_content "fair"
  end
  scenario 'a user can publish a peep to the database' do
    sign_in
    visit '/peep/new'
    fill_in "peep", with: "#fun at fair"
    click_button "Send peep"
    peep = Peep.first
    expect(peep.post).to include('fair')
  end
end
