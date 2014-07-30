require 'rails_helper'

RSpec.describe "blockers/show", :type => :view do
  before(:each) do
    @blocker = assign(:blocker, Blocker.create!(
      :blocker => "Blocker",
      :cohort => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Blocker/)
    expect(rendered).to match(//)
  end
end
