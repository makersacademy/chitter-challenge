require 'spec_helper'

feature "user can add new cheets" do

  scenario "adding new link from the homepage" do
    visit '/'
    add_cheet("Hello world", "2015-02-27", 1)
    expect(Cheet.count).to eq(1)
    cheet = Cheet.first
    expect(cheet.message).to eq("Hello world")
    expect(cheet.created_at).to eq(Date.new(2015,2,27))
    expect(cheet.user_id).to eq(1)
  end

  def add_cheet(message,created_at,user_id)
    within("#post-cheet") do
      fill_in 'message', :with => message
      fill_in 'date', :with => created_at
      page.all("input[name=user_id]", :visible => false).first.set(1)
      click_button 'Post Cheet'
    end
  end




end