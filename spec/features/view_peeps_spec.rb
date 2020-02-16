feature 'has a page for viewing peeps' do
  scenario '#can view an entered peep' do
    visit('/make_a_peep')
    fill_in :new_peep, with: "This is my first peep (view spec)"
    fill_in :user, with: "Flounder (view spec)"
    click_button('Submit')
    visit('/view_peeps')
    expect(page).to have_content("Flounder (view spec)")
    expect(page).to have_content("This is my first peep (view spec)")
  end
end
