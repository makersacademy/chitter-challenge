require 'spec_helper'

feature "displays the homepage" do
  scenario "should return status 200" do
    visit("/")
    expect(page.status_code).to eq(200)
  end
end