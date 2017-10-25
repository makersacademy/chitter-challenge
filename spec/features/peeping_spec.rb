require_relative 'spec_helper'

feature "Peeping" do
  scenario "user cannot peep if not logged in" do
    visit('/peeps')
    expect(page).not_to have_content("Post your peep")
  end

  scenario "user can peep if logged in" do
    sign_up_as_mormolis
    log_in_as_mormolis
    
    expect(page).to have_content("Post your peep")
  end

  scenario "user peeps, DB table peeps has new entry" do
    sign_up_as_mormolis
    log_in_as_mormolis
    expect { peep_it }.to change(Peep, :count).by(1)
  end
end
