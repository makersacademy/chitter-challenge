feature "user wants to sign up" do
  scenario "users adds email, password and user name" do
    register
    expect(page).to have_content("Hello, Rocky")
  end
end

# feature "ChitterChatter displays the username by the peep" do
#   scenario "can see the username associated with the peep" do
#     register
#     post_a_peep
#     expect(page).to have_text(/Rocky .+ Posted .+ Today/ )
#   end

# end