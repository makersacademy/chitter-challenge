feature "View post" do
  scenario "should be able see posts" do
    Peep.create(message: 'I can view my first peep')

    visit '/peeps'
    expect(page.status_code).to eq 200

    expect(page).to have_content('I can view my first peep')
  end
end
