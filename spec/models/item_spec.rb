require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'associations' do 
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:status)}
    it {should validate_presence_of(:quantity)}
    it { should validate_numericality_of(:quantity).only_integer }
    it { should validate_numericality_of(:quantity).is_greater_than_or_equal_to(0) }
    it { should define_enum_for(:status).with(['In stock', 'Out of stock']) }
  end
end
