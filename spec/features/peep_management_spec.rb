require 'spec_helper'

feature "Creating peeps" do

  let(:user) { create :user }

  scenario "I can create a peep when signed in" do
    sign_in(user: user.username, password: user.password )
    create_peep(text: "It's working")
    expect(page.current_path).to eq '/'
    within '.peep' do
      expect(page).to have_content "It's working"
    end
  end

  scenario "I cannot create a peep unless I am logged in" do
    visit '/'
    expect(page).not_to have_content 'Peep'
  end
end

feature "Viewing peeps" do
  let(:user) { create :user }

  scenario "I can see existing peeps on the peeps page" do
    sign_in(user: user.username, password: user.password)
    create_peep(text: "Chitter test")
    click_button 'Sign out'
    visit '/'
    expect(page.status_code).to eq 200
    within '.peeps' do
      expect(page).to have_content "Chitter test"
    end
  end

  scenario "I can see the name and username of the creator, the peep and the date it was posted" do
    sign_in(user: user.username, password: user.password)
    create_peep(text: "I can see you")
    expect(page).to have_content "Created by: #{user.name}"
    expect(page).to have_content "Logged in as: #{user.username}"
    expect(page).to have_content "Written on: #{Time.now.strftime("%H:%M %d/%m/%Y")}"
    expect(page).to have_content "I can see you"
  end
end
