require 'rails_helper'

describe Restaurant do
  describe '#create' do
    it "is invalid without a restaurant_name" do
      restaurant = create(:restaurant, restaurant_name: "")
      restaurant.valid?
      expect(restaurant.errors[:restaurant_name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      restaurant = build(:restaurant, describe: "")
      restaurant.valid?
      expect(restaurant.errors[:describe]).to include("can't be blank")
    end

    it "is invalid without a tel" do
      restaurant = build(:restaurant, tel: "")
      restaurant.valid?
      expect(restaurant.errors[:tel]).to include("can't be blank")
    end

    it "is invalid without a average_price_lunch" do
      restaurant = build(:restaurant, average_price_lunch: "")
      restaurant.valid?
      expect(restaurant.errors[:average_price_lunch]).to include("can't be blank")
    end

    it "is invalid without a average_price_dinner" do
      restaurant = build(:restaurant, average_price_dinner: "")
      restaurant.valid?
      expect(restaurant.errors[:average_price_dinner]).to include("can't be blank")
    end

    it "is invalid without a genre" do
      restaurant = build(:restaurant, genre: "")
      restaurant.valid?
      expect(restaurant.errors[:genre]).to include("can't be blank")
    end

    
    it "Save if all are met" do
      restaurant = create(:restaurant)
      expect(restaurant).to be_valid
    end

  end

end