require 'spec_helper'

feature "Creating peeps" do
  scenario "I can create a new peep" do
    visit '/peeps/new'
    fill_in 'peep', with: 'My first peep'
    click_button 'Create peep'
    #we expect to be redirected
    expect(page.current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content "My first peep"
    end
  end

end

feature "Viewing peeps" do

  scenario "I can see existing peeps on the peeps page" do
    Peep.create(peep: 'Chitter test')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content "Chitter test"
    end
  end
end
