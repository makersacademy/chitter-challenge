require 'spec_helper'

feature "Creating peeps" do

  let(:user) { create :user }

  scenario "I can create a peep when signed in" do
    sign_in(user: user.username, password: user.password )
    create_peep(text: "It's working")
    expect(page.current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content "It's working"
    end
  end

  scenario "I cannot create a peep unless I am logged in" do
    visit '/peeps'
    click_button 'New Peep'
    expect(page).to have_content 'Please sign in first.'
  end
end

feature "Viewing peeps" do
  let(:user) { create :user }

  scenario "I can see existing peeps on the peeps page" do
    sign_in(user: user.username, password: user.password)
    create_peep(text: "Chitter test")
    click_button 'Sign out'
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content "Chitter test"
    end
  end

  scenario "I can see the peep, the name and username of the creator" do
    sign_in(user: user.username, password: user.password)
    create_peep(text: "I can see you")
    expect(page).to have_content "Name: #{user.name}"
    expect(page).to have_content "Username: #{user.username}"
    expect(page).to have_content "#{Time.now.strftime("%H:%M %d/%m/%Y")}"
  end
end
