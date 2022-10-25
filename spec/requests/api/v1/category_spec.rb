require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do
  describe "GET /index" do
    before do
      create(:category, id:1, name: 'Beauty')
      create(:category, id:2, name: 'Housing')
    end
    

    it 'return http status ok' do 
      get '/api/v1/category/index'
      expect(response) .to have_http_status(:ok) 
    end  
  end
  describe 'GET /show' do
    let(:category) {create(:category)}
    context 'id does exist' do
      before do
        get"/api/v1/category/show/#{genre.id}"
      end
    end
    context'id not found' do
      before do
        get "/api/v1/category/show/-1"
      end
      it 'return http status not_found' do
        expect(response).to have_http_status(:not_found)
      end  
    end
  end
  describe 'POST /create' do
    let(:category_params) do 
      attributes_for(:category)
    end 
    context 'params check ok' do
      it 'return http status created' do 
        p category_params
        post "/api/v1/category/create", params:{category: category_params}
        expect(response).to have_http_status(:created)
      end
    end
    context 'bad params' do
      it 'when param is nil' do 
        post "/api/v1/category/create", params:{category: nil}
        expect(response).to have_http_status(:bad_request)
      end
    end  
  end
  describe 'PATCH/update' do  
    let(:category) do
      create(:category,name: "Kitchen")
    end  
    context 'params ok' do
      it 'return http status ok' do
        patch "/api/v1/category/update/#{category.id}", params:{category: {name:"Utility"}}
        expect(response).to have_http_status(:ok)
      end
    end    
    context 'bad params'do
      it 'when params is nill' do
          patch "/api/v1/category/update/#{category.id}", params:{category: {name: nil}}
         expect(response).to have_http_status(:bad_request)
      end   
    end
  end   
    describe 'DELETE/delete_id' do  
      let(:category) do
        create(:category)
      end    
      context 'params ok' do
        it 'return http status ok' do
          delete "/api/v1/category/delete/#{category.id}"
          expect(response).to have_http_status(:ok)
        end
      end
      context 'bad params' do
        it 'params is nill' do
          delete "/api/v1/category/delete/-1"
          expect(response).to have_http_status(:bad_request)
        end
      end   
  end      
end
