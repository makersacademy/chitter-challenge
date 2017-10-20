feature 'signing up for chitter' do
  
    scenario 'user signs into to chitter' do
      expect { sign_up }.to change { User.all.count }.by 1
      expect(current_path).to eq '/peeps'
      expect(page).to have_content 'Welcome, Ainsley'
    end
  
  end
