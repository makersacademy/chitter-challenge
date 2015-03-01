require 'spec_helper'

feature "User adds a new chit" do
  scenario "when browsing the homepage" do
    expect(Chit.count).to eq(0)
    visit '/'
    add_chit("@Diego", "Chit is the real thing")
    expect(Chit.count).to eq(1)
    chit = Chit.first
    expect(chit.username).to eq("@Diego")
    expect(chit.text).to eq("Chit is the real thing")
  end

  def add_chit(username, text)
    within('#new-chit') do
      fill_in 'username', :with => username
      fill_in 'text', :with => text
      click_button 'Add new Chit!'
    end
  end
end