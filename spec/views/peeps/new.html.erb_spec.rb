require 'rails_helper'

RSpec.describe "peeps/new", type: :view do
  before(:each) do
    assign(:peep, Peep.new(
      content: "MyText",
      user_id: 1
    ))
  end

  it "renders new peep form" do
    render

    assert_select "form[action=?][method=?]", peeps_path, "post" do

      assert_select "textarea[name=?]", "peep[content]"

      assert_select "input[name=?]", "peep[user_id]"
    end
  end
end
