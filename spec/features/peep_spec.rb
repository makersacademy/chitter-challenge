# feature 'a user can add a peep' do
#     let (:user_email) {double user_email: 'mac@gmail.com'}
#     let (:first_name) {double first_name: 'Shirley'}
#     scenario 'a user can regenter a peep' do
#         connection = PG.connect(dbname: 'chitter_manager_test')
#         connection.exec("INSERT INTO user_chitter (id, first_name, last_name, user_email, user_password, user_name) VALUES(1,'Shirley', 'Mac', 'mac@gmail.com', 'password', 'SAM11');")
       
#         visit('/createchitter')
#         fill_in :peep , with:' FIRST PEEP'
#         click_button 'submit'
#         expect(page).to have_content "FIRST PEEP"
#     end
#   end
