require 'spec_helper'
require './data_mapper_setup'


feature "seeing peeps" do
  scenario "visiting the pees page, I can see the peeps" do
    peep = Peep.new(message: "my message", name: "Retesh", username: "rets")
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content("my message")
    end
  end
end