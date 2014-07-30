require 'rails_helper'

RSpec.describe "Blockers", :type => :request do
  describe "GET /blockers" do
    it "works! (now write some real specs)" do
      get blockers_path
      expect(response.status).to be(200)
    end
  end
end
