feature 'A user can post a peep' do

	 before(:each) do
 		 sign_up
 	end

	 scenario 'successful peep' do
 		 expect { post_peep }.to change(Peep, :count).by(1)
 		 expect(page).to have_content 'This is a peep'
 	end

end
