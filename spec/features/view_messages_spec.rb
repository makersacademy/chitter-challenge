feature "view posted messages" do
  scenario "user can view messages in reverse chronological order" do
    clear_database_table()
    visit("/")
    fill_in :content, with: "If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently."
    click_button "Post"
    first_button_click = Time.now
    fill_in :content, with: "If Kubernetes is based off of Borg. Is it called Kubernetes because the Borg ship is a Kube?"
    click_button "Post"
    second_button_click = Time.now
    fill_in :content, with: "Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend."
    click_button "Post"
    third_button_click = Time.now
    posts = page.find(".posts").all(".post")
    expect(posts.length).to eq 3
    expect(posts[0].text).to have_content "Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend."
    expect(posts[0]).to have_content first_button_click.strftime("%H:%M")
    expect(posts[1].text).to have_content "If Kubernetes is based off of Borg. Is it called Kubernetes because the Borg ship is a Kube?"
    expect(posts[1]).to have_content second_button_click.strftime("%H:%M")
    expect(posts[2].text).to have_content "If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently."
    expect(posts[2]).to have_content third_button_click.strftime("%H:%M")
  end
end
