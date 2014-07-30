require 'rails_helper'

RSpec.describe "blockers/new", :type => :view do
  before(:each) do
    assign(:blocker, Blocker.new(
      :blocker => "MyString",
      :cohort => nil
    ))
  end

  it "renders new blocker form" do
    render

    assert_select "form[action=?][method=?]", blockers_path, "post" do

      assert_select "input#blocker_blocker[name=?]", "blocker[blocker]"

      assert_select "input#blocker_cohort_id[name=?]", "blocker[cohort_id]"
    end
  end
end
