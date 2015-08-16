feature 'I can use chitter to' do

  let(:user) do
      User.new(name: 'John', 
               user_name: 'Johnnyboy', 
               email: 'john@example.com',
               password: '12345') 
  end

  feature 'to post a peep' do
    scenario 'which will be registerd in the database' do
      peep = 'This is a sample peep.'
      expect { post_a peep, user.user_name }.to change(Peep, :count).by(1)
    end
    scenario 'with my user ID' do
      sign_up_a user
      peep = 'This is a sample peep.'
      expect { post_a peep, user.user_name }.to change(Peep, :count).by(1)
      expect(page).to have_content("Thanks for peeping")
    end
  end
  

end