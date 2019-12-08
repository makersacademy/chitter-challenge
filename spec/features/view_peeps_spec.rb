feature "viewing list of peeps" do
  scenario "lists all peeps" do

    Peep.create(userid: 'abacon', content: "this is peep1")
    Peep.create(userid: 'abacon', content: "this is peep2")
    Peep.create(userid: 'abacon', content: "this is peep3")
    
    sign_in

    expect(page).to have_content("this is peep1")
    expect(page).to have_content("this is peep2")
    expect(page).to have_content("this is peep3")
  end

end