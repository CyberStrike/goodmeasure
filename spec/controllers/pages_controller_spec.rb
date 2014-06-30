require 'rails_helper'

RSpec.describe PagesController, :type => :controller do

  describe "GET 'splash_page'" do
    it "returns http success" do
      get 'splash_page'
      expect(response).to be_success
    end
  end

end
