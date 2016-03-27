feature "Add comments" do
  scenario "another user can add a comment to a peep when logged in" do
    sign_up
    post "I have an emo nephew."
    sign_up(name: "Han",
            username: "solo",
            email: "han@starwars.com",
            password: "falcon1000",
            password_confirmation: "falcon1000")
    comment "You're welcome."
    expect(page).to have_content "You're welcome."
    expect(page).to have_content "Han @solo"
  end
end
