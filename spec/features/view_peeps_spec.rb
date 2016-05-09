
feature 'Visualize all the peeps written' do
	scenario 'Visualize all the peeps writtten by users' do
		sign_up
		create_peep
		create_peep(message = "I think this is a peep")
		expect(page).to have_content "Am I peeping?"
		expect(page).to have_content "I think this is a peep"
	end
end

feature 'Peeps listed by time' do
	scenario 'New ones comes first' do
		sign_up
		create_peep
		sleep 0.02
		create_peep(message = "I think this is a peep")
		expect("Am I peeping?").to appear_before("I think this is a peep")
	end
end