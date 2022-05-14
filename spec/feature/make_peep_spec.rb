feature "Peep Creation & Viewing" do
  scenario "Make a peep (without a login)" do
    visit('/')
    fill_in :handle, with: "@user_anish"
    fill_in :name, with: "Anish"
    fill_in :peep, with: "First peep on Chitter! :D"
    click_button 'Submit Peep'
    expect(page).to have_content "Anish, (@user_anish): First peep on Chitter! :D"
  end
end

