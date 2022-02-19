feature "show peep" do
  scenario "user can see a peep" do

    user = create_test_user
    peep = Peep.create(peep: "Wow, that's so cool", user_id: user.id)
    visit("/peep/#{peep.id}")
    expect(page).to have_content("Wow, that's so cool")
  end
end
