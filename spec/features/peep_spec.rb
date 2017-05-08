feature 'Viewing peeps' do
 
   scenario 'I can see all peeps on chitter on the peeps page' do
     sign_up
     sign_in(email: 'john@example.com', password: '123456')
     Peeps.create(peep: 'Hey!!')

     visit '/'
     expect(page.status_code).to eq 200
     expect(page).to have_content('Hey!!')

   end
 end

 feature 'Writing peeps' do

   scenario 'I can create a new peep' do
     visit '/peeps/new'
     fill_in 'peep',   with: 'I am peeping!'
     click_button 'Peep!'
     expect(current_path).to eq '/'
     expect(page).to have_content('I am peeping!')
   end
 end
