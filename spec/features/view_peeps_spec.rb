feature "view peeps" do
  scenario "peeps display in reverse chronological order" do
    user_sign_up
    add_peep
    add_another_peep
    add_yet_another_peep
    expect("If you don't know where you are going any road can take you there.").to appear_before("Why is a raven like a writing-desk?")
    expect("Why is a raven like a writing-desk?").to appear_before("If everybody minded their own business, the world would go around a great deal faster than it does.")
  end
end
