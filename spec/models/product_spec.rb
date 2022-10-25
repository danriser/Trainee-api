require 'rails_helper'

RSpec.describe Product, type: :model do
  context "Factory test" do
    it {expect(build(:product)).to be_valid}
  end
  
  context "Validating price"  do
    it 'invalid price if nil' do
      preco = Product.new(price: nil)
      expect(preco).to_not be_valid
    end  
  end 
  context "Check stock"  do
    it "Stock is empty" do
      estoque =Product.new(stock: nil)
      expect(estoque).to_not be_valid
    end  
  end
  context "Brand test"  do
    it 'invalid product if has no brand' do
      marca = Product.new(brand_id: nil)
      expect(marca).to_not be_valid
    end
  end    
  
  context "Category test"  do
    it 'invalid product if has no category' do
      categ = Product.new(category_id: nil)
      expect(categ).to_not be_valid
    end
  end



end
