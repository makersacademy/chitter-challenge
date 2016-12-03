require 'spec_helper'
require 'web_helper'

feature "Posting a peep", type: :feature do

  def add_peep
    visit('/peep_board')
    expect(page.status_code).to eq 200
    click_button("Add Peep")
    fill_in("peep", with: "Nothing that easy is rewarding")
    click_button("Post")
    click_button("Add Peep")
    fill_in("peep", with: "Be somebody and no one thought you can be")
    click_button("Post")
  end

  scenario "I want to be able to post a peep" do


    expect{ add_peep }.to change(Peep, :count).by(2)
    within 'ul#peeps' do
    expect(page).to have_content "Be somebody and no one thought you can be"
    expect(page).to have_content "Nothing that easy is rewarding"
    # expect(User.first.name).to eq "Courtney"
    end
  end
end
