require './app/app.rb'

describe "Peep" do

  scenario "User can visit page to add a peep after sign-up" do
    visit '/'
    sign_up
    click_link "PEEP!"
    expect( current_path ).to eq( '/peep' )
    expect( page ).to have_button( "SUBMIT" )
  end

  scenario "User cannot visit page to add a peep before sign-up or log-in" do
    visit '/'
    expect( page ).not_to have_button( "PEEP!" )
  end

  scenario "User can see all peeps" do
    sign_up
    peep
    all_peeps = Peep.all
    expect( all_peeps.count ).to eq 1
  end

  scenario "User can see the message when peeped" do
    sign_up
    peep
    expect( page ).to have_content( "Peeeeeeeeeep" )
  end

  scenario "User can see peeps with time" do
    sign_up
    time_now = Time.now.strftime("%I:%M %p  %Y-%m-%d")
    peep( time_now: time_now )
    expect( page ).to have_content( time_now )
  end

end
