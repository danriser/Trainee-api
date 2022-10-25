require 'rails_helper'

RSpec.describe "Api::V1::Brands", type: :request do
  describe "GET /index" do
    before do
      create(:brand, id:1, name: 'Beauty')
      create(:brand, id:2, name: 'Housing')
    end
    

    it 'return http status ok' do 
      get '/api/v1/brand/index'
      expect(response) .to have_http_status(:ok) 
    end  
  end
  describe 'GET /show' do
    let(:brand) {create(:brand)}
    context 'id does exist' do
      before do
        get"/api/v1/brand/show/#{brand.id}"
      end
    end
    context'id not found' do
      before do
        get "/api/v1/brand/show/-1"
      end
      it 'return http status not_found' do
        expect(response).to have_http_status(:not_found)
      end  
    end
  end
  describe 'POST /create' do
    let(:brand_params) do 
      attributes_for(:brand)
    end 
    context 'params check ok' do
      it 'return http status created' do 
        p brand_params
        post "/api/v1/brand/create", params:{brand: brand_params}
        expect(response).to have_http_status(:created)
      end
    end
    context 'bad params' do
      it 'when param is nil' do 
        post "/api/v1/brand/create", params:{brand: nil}
        expect(response).to have_http_status(:bad_request)
      end
    end  
  end
  describe 'PATCH/update' do  
    let(:brand) do
      create(:brand,name: "Kitchen")
    end  
    context 'params ok' do
      it 'return http status ok' do
        patch "/api/v1/brand/update/#{brand.id}", params:{brand: {name:"Utility"}}
        expect(response).to have_http_status(:ok)
      end
    end    
    context 'bad params'do
      it 'when params is nill' do
          patch "/api/v1/brand/update/#{brand.id}", params:{brand: {name: nil}}
         expect(response).to have_http_status(:bad_request)
      end   
    end
  end   
    describe 'DELETE/delete_id' do  
      let(:brand) do
        create(:brand)
      end    
      context 'params ok' do
        it 'return http status ok' do
          delete "/api/v1/brand/delete/#{brand.id}"
          expect(response).to have_http_status(:ok)
        end
      end
      context 'bad params' do
        it 'params is nill' do
          delete "/api/v1/brand/delete/-1"
          expect(response).to have_http_status(:bad_request)
        end
      end   
  end      
end
