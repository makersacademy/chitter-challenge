feature "Timestamps on messages" do
  scenario "User posts a message and sees the time on it" do
    sign_up
    post_new_peep("Hello world!")
    expect(page.find('li:nth-child(1)')).to have_content "#{Time.now.strftime("%d/%b/%Y %H:%M")}"
  end
end
