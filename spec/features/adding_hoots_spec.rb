require 'spec_helper'

feature "User adds a new hoot" do 

  scenario "When browsing the homepage" do 
    expect(Hoot.count).to eq(0)
    visit '/'
    add_hoot("Carrie123", "Hoot Hoot!")
    expect(Hoot.count).to eq(1)
    hoot = Hoot.first
    expect(hoot.username).to eq("Carrie123")
    expect(hoot.message).to eq("Hoot Hoot!")
  end

  def add_hoot(username, message)
    within('#new-hoot') do 
      fill_in 'username', :with => username
      fill_in 'message', :with => message
      click_button 'Join Parliament!'
    end
  end
end