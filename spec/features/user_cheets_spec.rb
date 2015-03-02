require 'spec_helper'

feature "user adds a new cheet" do

  scenario "when browsing the homepage" do
    expect(Cheet.count).to eq 0
    visit('/')
    add_cheet("what a great day")
    expect(Cheet.count).to eq 1
    cheet = Cheet.first
    expect(cheet.text).to eq("what a great day")
  end

  def add_cheet(text)
    within('#new-cheet') do
      fill_in 'text', :with => text
      click_button 'Add cheet'
    end
  end

end

