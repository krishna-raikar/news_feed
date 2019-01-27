require 'rails_helper'

RSpec.describe NewsFeedController, type: :controller do
  describe "#index" do
    before(:each) do 
      create(:comment) #creates both user and post
      create(:comment)      
    end

    def visit_index_page(params={})
      get :index, params: params, format: :json
    end

    it "should return success response" do
      visit_index_page
      
      expect(response).to have_http_status(200)
    end    

    it "should have set default page and default per page setting" do
      page_size = controller.class.const_get('PAGE_SIZE')
      default_page = controller.class.const_get('DEFAULT_PAGE')
      
      expect(page_size).to eq(50)
      expect(default_page).to eq(1)
    end

    it "should return feeds" do
      visit_index_page
      result = JSON.parse(response.body)
      
      expect(result["news_feed"].count).to be 2
    end

    it "should return feeds with required fields" do
      visit_index_page
      result = JSON.parse(response.body)
      expected_json = JSON.parse(form_json_response.to_json)
      
      expect(result["news_feed"]).to match(expected_json)
    end

    it "should empty feeds when are no feeds available" do
      Comment.destroy_all;Post.destroy_all;User.destroy_all
      visit_index_page
      result = JSON.parse(response.body)
      
      expect(result["news_feed"]).to be_empty
    end

    it "should return paginated result" do
      params = { page: 1, per_page: 1 }
      visit_index_page(params)
      result = JSON.parse(response.body)
      
      expect(result["news_feed"].count).to eq 1
    end

    it "should return recent feed when paginated results" do
      params = { page: 1, per_page: 1 }
      visit_index_page(params)
      result = JSON.parse(response.body)
      first_post = [Post.order(created_at: :desc).first]
      expected_json = JSON.parse(form_json_response(first_post).to_json)
      
      expect(result["news_feed"]).to match(expected_json)
    end
  end
end
