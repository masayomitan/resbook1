FactoryBot.define do

  factory :restaurant do
    restaurant_name       {"店の名前"}
    describe              {"説明"}
    tel                   {"1234567890"}
    average_price_lunch   {300}
    average_price_dinner  {300}
    genre                 {3}
  end

end
