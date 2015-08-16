feature 'I can use chitter to' do

  let(:user) do
      User.new(name: 'John', 
               user_name: 'Johnnyboy', 
               email: 'john@example.com',
               password: '12345') 
  end

    scenario 'post a peep when logged in' do
      sign_up_a user
      peep = 'This is a sample peep.'
      expect { post_a peep }.to change(Peep, :count).by(1)
      expect(page).to have_content("Thanks for peeping")
    end
    scenario 'post a peep when logged in BUT not when logged out' do
      peep = 'This is a sample peep.'
      expect { post_a peep }.to change(Peep, :count).by(0)
      expect(page).to have_content("You must sign in to peep")
    end
    scenario 'see all posts in reverse chronological order' do
      peep = "Peep 1"
      second_peep = "Peep 2"
      post_a peep
      post_a second_peep
      visit 'peep/all'
      expect("Peep 2").to appear_before("Peep 1")
    end

end