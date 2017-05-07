# feature "user can add links" do
#    before do
#      sign_up
#    end
#
#   scenario "save peeps to database" do
#     create_peep
#     expect(current_path).to eq '/home'
#     expect(page).to have_content("Hello Chitter")
#   end
#
#   scenario 'Most recent peep is last, switched at view level' do
#     create_peep
#     click_button 'New Peep'
#     fill_in :peep, with: "Hello Chitter 2"
#     click_button "Submit"
#     expect(current_path).to eq '/home'
#     peep = Peep.last.peep
#     expect(peep).to include("Hello Chitter 2")
#   end
# end
