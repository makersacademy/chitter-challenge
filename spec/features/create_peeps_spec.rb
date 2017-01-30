feature 'Creating peeps' do

	let(:user) { User.create(email: "test@test.com", password: 'password', password_confirmation: 'password') }


  context "when properly constructed" do
    scenario "user can add a peep to the app" do
  		sign_up_and_login
      expect { peep("This is my peep") }.to change(Peep, :count)
			expect(current_path).to eq('/')
			within(:css, 'ul#peeps') { expect(page).to have_content("This is my peep") }

		end
  end

  # context "when not properly constructed" do
  #   scenario "user cannot add a peep to the app" do
  # 		sign_up_and_login
  #     expect { peep(generate_string(101)) }.not_to change(Peep, :count)
	# 	end
  # end


    context "when not logged on"  do
      scenario "user cannot type a peep" do
        visit('/')
        expect(page).to_not have_content('Type your peep below:')
      end
    end

    context "when logged on"  do
      scenario "user can type a peep" do
        sign_up_and_login
        expect(page).to have_content('Type your peep below:')
      end
    end
end
