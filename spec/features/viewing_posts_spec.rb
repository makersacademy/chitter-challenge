feature 'Viewing posts' do

  before(:each) do
    @time = Time.new
    @specific_time = @time.strftime("%A, %B %e, %Y, %k:%M")
    allow(Time).to receive(:new) {@time}
  end

  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_challenge_test')

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

  scenario 'user can see a timestamp on their tweets' do
    Peep.create(comment: "I literally only drink belle delphine bathwater")
    visit('/peeps')
    expect(page).to have_content @specific_time
  end
end
