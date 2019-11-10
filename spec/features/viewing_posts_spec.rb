feature 'Viewing posts' do

  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter-challenge-test')

    Peep.create(comment: "Hacking!!")
    Peep.create(comment: "GET BACK TO THE LOBBY")
    Peep.create(comment: "You are literally the worst player I have ever seen")
    Peep.create(comment: "That was lag bro get off me")

    visit('/peeps')

    expect(page).to have_content "Hacking!!"
    expect(page).to have_content "GET BACK TO THE LOBBY"
    expect(page).to have_content "You are literally the worst player I have ever seen"
    expect(page).to have_content "That was lag bro get off me"
  end
end
