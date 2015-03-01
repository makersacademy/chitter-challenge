require 'spec_helper'

feature "User posts a new Peep" do
  scenario "when on the homepage" do
    expect(Peep.count).to eq(0)
    visit '/'
    post_peep("Hello Chitter!")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.text).to eq("Hello Chitter!")
  end

  def post_peep(text)
    within('#new-peep') do
      fill_in 'text', :with => text
      click_button 'Post'
    end
  end
end
