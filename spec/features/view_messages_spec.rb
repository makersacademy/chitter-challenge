feature "view posted messages" do
  scenario "user can view messages in reverse chronological order" do
    clear_database_table()
    visit("/")
    fill_in :content, with: "If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently."
    click_button "Post"
    fill_in :content, with: "If Kubernetes is based off of Borg. Is it called Kubernetes because the Borg ship is a Kube?"
    click_button "Post"
    fill_in :content, with: "Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend."
    click_button "Post"
    posts = page.find(".posts").all("li")
    expect(posts.length).to eq 3
    p posts[0][:id]
    expect(posts[0].text).to eq "Can I list a world of warcraft rank 1 under achievements on a cv? Asking for a friend."
    expect(posts[1].text).to eq "If Kubernetes is based off of Borg. Is it called Kubernetes because the Borg ship is a Kube?"
    expect(posts[2].text).to eq "If the aliens in Independence Day used Kubernetes; the movie would have turned out a lot differently."
  end
end
