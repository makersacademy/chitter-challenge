feature 'Show timestamp with every creet' do
	scenario 'every timestamp is shown after message' do
		sign_up
		time = Time.now.strftime("%H:%M:%S").to_s
		Message.create(text: "Time stamp test", time: time)
		expect(page).to have_content(time)
	end
end
