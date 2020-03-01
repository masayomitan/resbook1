# DB 設計

## users テーブル
|Column|Type|Options|
|------|----|-------|
|name      |string|null:false, unique: true|
|email                  |string|null: false|
|password               |string|null: false|
### Association
- has_many :reservations, dependent: :destroy
- has_many :reviews

## restaurant テーブル
|Column|Type|Options|
|------|----|-------|
|restaurant_name        |integer|null: false|
|describe               |integer|null: false|
|address                |integer|null: false| 
|tel                    |string|null: false|
|average_price_lunch    |string|null: false|
|average_price_dinner   |string|null: false|
|genre_id               |string|null: false|
|tel                    |integer|null: false|
|user                   |references|null: false|

|latitude               |float|
|longitude              |float|

|cards                  |boolean|
|parking                |boolean|
|all_you_can_eat        |boolean|
|all_you_can_drink      |boolean|
|tobacco                |boolean|
|free_wifi              |boolean|
|private_room           |boolean|
|party                  |boolean|
|takeout                |boolean|
|holiday                |boolean|
### Association
- belongs_to_active_hash :genre
- belongs_to :user, optional: true
- has_many :images, foreign_key: :restaurant_id
- has_many :reservations
- has_many :reviews, dependent: :destroy

## images テーブル
|Column|Type|Options|
|------|----|-------|
|image  |string|null: false|
|restaurant   |references|null: false, foreign_key: true|
### Association
- belongs_to :restaurant

## reservation テーブル
|Column|Type|Options|
|------|----|-------|
|user         |references|null: false, foreign_key: true|
|restaurant   |references|null: false, foreign_key: true|
|date         |integer   |null: false|
|time         |integer   |null: false|
### Association
- belongs_to :restaurant
- belongs_to :user

## reviews テーブル
|Column|Type|Options|
|------|----|-------|
|user         |references|null: false, foreign_key: true|
|restaurant   |references|null: false, foreign_key: true|
|commetnt     |text      |null: false|
|star         |float     |null: false, default 1|
### Association
- belongs_to :user
- belongs_to :restaurant

url
http://18.180.65.107/

