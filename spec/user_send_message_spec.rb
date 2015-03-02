require 'spec_helper'

feature 'User send message' do 

  before do
    User.create(:name => "John117", :email => "aaa@email.com", :password => "0451")
  end

  scenario "sending a message" do 
    visit '/users/home'
    fill_in 'content', :with => "Hello, World!"
    click_on("submit message")
    expect(current_path).to eq '/'
    expect(page).to have_content("Hello, World!")
  end
end