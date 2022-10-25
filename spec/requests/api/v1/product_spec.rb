require 'rails_helper'

RSpec.describe "Api::V1::Products", type: :request do
  describe "GET /index" do
    it 'return http status ok' do 
      get '/api/v1/product/index'
      expect(response) .to have_http_status(:ok) 
    end  
  end
  describe 'GET /show' do
    let(:product) {create(:product)}
    context 'id does exist' do
      before do
        get"/api/v1/product/show/#{product.id}"
      end
    end
    context'id not found' do
      before do
        get "/api/v1/product/show/-1"
      end
      it 'return http status not_found' do
        expect(response).to have_http_status(:not_found)
      end  
    end
  end
  describe 'POST /create' do
    let(:category){create(:category)}
    let(:brand){create(:brand)}
    let(:product_params) do
      attributes_for(:product).except(:category, :brand).merge({ category_id: category.id, brand_id: brand.id })
    end
    context 'params check ok' do
      it 'return http status created' do 
        p product_params
        post "/api/v1/product/create", params:{product:product_params}
        expect(response).to have_http_status(:created)
      end
    end
    context 'bad params' do
      it 'when param is nil' do 
        post "/api/v1/product/create", params:{product: nil}
        expect(response).to have_http_status(:bad_request)
      end
      it 'when desc is nil' do 
        post "/api/v1/product/create", params:{product:{description:nil}}
        expect(response).to have_http_status(:bad_request)
      end
    end  
  end
  describe 'PATCH/update' do  
    let(:brand) {create(:brand)}
    let(:category){create(:category)}    
    let(:product) do
      create(:product)
    end  
    context 'params ok' do
      it 'return http status ok' do
        patch "/api/v1/product/update/#{product.id}", params:{product:{name: "Lapis"}}
        expect(response).to have_http_status(:ok)
      end
    end    
    context 'bad params'do
      it 'when params is nill' do
          patch "/api/v1/product/update/#{product.id}", params:{product: nil}
         expect(response).to have_http_status(:bad_request)
      end 
      it 'when params are the same' do
        patch "/api/v1/product/update/#{product.id}", params:{product:{name: "Tapete",description: "This is an item",price: 1, stock:1, brand_id:brand.id, category_id:category.id}}
       expect(response).to have_http_status(:bad_request)

      end   
    end
  end   
    describe 'DELETE/delete_id' do  
      let(:product) do
        create(:product)
      end    
      context 'params ok' do
        it 'return http status ok' do
          delete "/api/v1/product/delete/#{product.id}"
          expect(response).to have_http_status(:ok)
        end
      end
      context 'bad params' do
        it 'params is nill' do
          delete "/api/v1/product/delete/-1"
          expect(response).to have_http_status(:bad_request)
        end
      end   
    end     
end
