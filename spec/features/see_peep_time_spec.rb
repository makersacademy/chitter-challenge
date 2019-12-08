feature "See peep's time" do
  scenario "A maker can see the time at which a peep was made" do
    sign_up
    sign_in

    post_time = Time.new(2019, 02, 24, 12, 0, 0, "+00:00")
    Timecop.freeze(post_time)
    post_peep

    expect(current_path).to eq "/peeps"
    expect(page).to have_content "2019-02-24 12:00:00"
  end
end
