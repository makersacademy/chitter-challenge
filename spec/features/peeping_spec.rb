feature "Peeps homepage" do

  let!(:peep) {"Bacon ipsum dolor amet pig bacon por."}

  scenario "a user can write a peep" do

    sign_up
    correct_log_in
    post_peep
    expect(page).to have_content(peep)
    expect{post_peep}.to change{Peep.count}.by 1

  end
end
