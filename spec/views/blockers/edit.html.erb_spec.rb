require 'rails_helper'

RSpec.describe "blockers/edit", :type => :view do
  before(:each) do
    @blocker = assign(:blocker, Blocker.create!(
      :blocker => "MyString",
      :cohort => nil
    ))
  end

  it "renders the edit blocker form" do
    render

    assert_select "form[action=?][method=?]", blocker_path(@blocker), "post" do

      assert_select "input#blocker_blocker[name=?]", "blocker[blocker]"

      assert_select "input#blocker_cohort_id[name=?]", "blocker[cohort_id]"
    end
  end
end
