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
|restaurant_name        |string |null: false|
|describe               |text   |null: false|
|address                |string |null: false| 
|tel                    |integer|null: false|
|average_price_lunch    |integer|null: false|
|average_price_dinner   |integer|null: false|
|genre_id               |integer|null: false|
|tel                    |integer|null: false|
|latitude               |float  |
|longitude              |float  |
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
|user                   |references|null: false|
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

#　内容
　ユーザー同士がお店の情報や感想、評価を共有し合うサイトです。
　
# 制作理由
このアプリケーションを作成した目的として以下をあげる:

前職で店長として働いてた時、某飲食大手サイトで店舗の情報登録、管　理をしていた経験を元に、一般ユーザー同士でもフランクに見せ合えるサイトがあったらいいなと考えた。

スクールで某フリマアプリを作成したのですが、自分が担当しなかった部分のアウトプットを含む＋αの機能の実施。

google map apiによる住所読み込み機能を試したかった。


# 誰のために作ったか
　良いお店は詳しいユーザーの伝える場所を提供。
　一回でも来店したお客さんが目視でだいたいわかるような情報だけをピックアップし投稿できるよう考えた。
　身内同士で盛り上がれるようなにっち

#