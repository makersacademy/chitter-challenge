feature "Peeps homepage" do

  let(:peep) {"Bacon ipsum dolor amet pig bacon por."}
  let(:peep2) {"Cow meatloaf flank, spare ribs be."}

  scenario "a user can write a peep" do

    sign_up
    correct_log_in
    post_peep
    expect(page).to have_content(peep)
    expect{post_peep}.to change{Peep.count}.by 1

  end

  scenario "peeps appear in reverse chronological order" do

    sign_up
    correct_log_in
    post_two_peeps
    expect(page.body.index(peep)).to be > page.body.index(peep2)


  end

  scenario "post has a timestamp" do
    sign_up
    correct_log_in
    post_peep
    expect(Peep.first.created_at).not_to eq nil
  end
end
