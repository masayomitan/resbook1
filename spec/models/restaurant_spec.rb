require 'rails_helper'

describe Restaurant do
  describe '#create' do
    it "is invalid without a restaurant_name" do
      # binding.pry
      restaurant = build(:restaurant, restaurant_name: "")
      restaurant.valid?
      expect(restaurant.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      restaurant = build(:restaurant, describe: "")
      restaurant.valid?
      expect(restaurant.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a size" do
      restaurant = build(:restaurant, tel: "")
      restaurant.valid?
      expect(restaurant.errors[:size]).to include("can't be blank")
    end

    it "is invalid without a status_id" do
      restaurant = build(:restaurant, average_price_lunch: "")
      restaurant.valid?
      expect(restaurant.errors[:status_id]).to include("can't be blank")
    end

    it "is invalid without a postage_id" do
      restaurant = build(:restaurant, average_price_lunch: "")
      restaurant.valid?
      expect(restaurant.errors[:postage_id]).to include("can't be blank")
    end

    it "is invalid without a region_id" do
      restaurant = build(:restaurant, genre: "")
      restaurant.valid?
      expect(restaurant.errors[:region_id]).to include("can't be blank")
    end

    
    it "Save if all are met" do
      restaurant = create(:restaurant)
      expect(restaurant).to be_valid
    end

  end

end