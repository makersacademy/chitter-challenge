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

  scenario "only a signed in user can write a peep" do
    visit("/peeps")
    expect(page).not_to have_button('peep')
  end

  scenario "peeps appear in reverse chronological order" do
    sign_up
    correct_log_in
    post_two_peeps
    expect(page.body.index(peep)).to be > page.body.index(peep2)
  end

  scenario "peep has a timestamp" do
    sign_up
    correct_log_in
    post_peep
    expect(Peep.first.created_at).not_to eq nil
  end

  scenario "Every peep belongs to a user" do
    sign_up
    correct_log_in
    post_peep
    user = User.first
    expect(user.peeps.map(&:name)).to include peep
  end
end
