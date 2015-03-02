require 'spec_helper'

feature "User creates new peep" do

  scenario "when browing the homepage" do
    expect(Peep.count).to be 0
    visit '/'
    post_peep("Hello Chitter", "Costas")
    expect(Peep.count).to eq 1
    peep = Peep.first
    expect(peep.content).to eq "Hello Chitter"
    expect(peep.user).to eq "Costas"
  end

  def post_peep(content, user)
    within('#new-peep') do
      fill_in 'content', :with => content
      fill_in 'user', :with => user
      click_button 'Post Peep'
    end
  end

end