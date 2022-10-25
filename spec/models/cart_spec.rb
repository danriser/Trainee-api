require 'rails_helper'

RSpec.describe Cart, type: :model do
  context "Factory test" do
    it {expect(build(:cart)).to be_valid}
  end 
end
