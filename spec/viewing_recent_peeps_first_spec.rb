feature "Viewing peeps in reverse chronological order" do
  scenario "I can see the most recent peeps first" do
    sign_up
    post_a_peep
    visit("/peeps/new")
    sleep(1) # try using timecop in the future
    fill_in :message, with: "My second peep!"
    click_button("Post")
    expect("My second peep!").to appear_before("My first peep!")
  end
end
