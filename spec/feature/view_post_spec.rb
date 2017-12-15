feature "View post" do
  scenario "should be able see posts" do
    Peep.create(message: 'first peep')

    visit '/peeps'
    expect(page.status_code).to eq 200

    expect(page).to have_content('first peep')
  end
end
