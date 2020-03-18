##  url
http://reabook.net/



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

##  フロント
- Haml
- Scss
- jQuery
- bootstrap4

##  バックエンド
- Ruby 2.5.1
- Ruby on Rails 6.0.2


##  サーバー , 開発環境等
- Nginx
- MySQL 5.6
- AWS（EC2, S3, route 53）
- Capistrano3
- unicorn
- rspec


#  サイト
ユーザー同士がお店の情報や感想、評価を共有し合うサイトです。
　
#  制作理由
このアプリケーションを作成した目的として以下をあげる:

前職で店長として働いてた時、某飲食大手サイトで店舗の情報登録、管理をしていた経験を元に一般ユーザー同士でもフランクにオススメのお店を見せ合える
サイトがあったらいいなと考えた。
スクールで某フリマアプリを作成したのですが、自分が担当しなかった部分のアウトプットを含む＋αの機能の実施。
google map apiによる住所読み込み機能を試したかった。
CRUD機能を改めてしっかり作る、他ユーザーの編集削除、未ログイン時のレビュー機能の非表示等、実用性を考えて作った。


#  誰のために作ったか
良いお店は詳しいユーザーの伝える場所を提供。
投稿ユーザーを中心にコミュニティが広がり、そこでのやりとりができるようにと思い制作中
一回でも来店したお客さんが目視でだいたいわかるような情報だけをピックアップし投稿できるよう考えた。

#  苦労した点
- レビューの星つき機能
  記事では簡単と書いてあるが、実際行うと予想外に詰まった。javascriptの勉強にとなんとか実装したかった。
- 店の登録時のDB設計と設計のview上での段取り
  フランクに登録出来ることを基準に考えどこまで登録させるかを悩んだ。
  実際に１画面で登録させると表示量が多く、解決策として専用のライブラリを使うことも考えたが、
  今後登録量を増やすときを考え、最低限の登録はcreate,追加情報登録をeditで対応した。

#  今後の課題
- ユーザーで投稿が重複してしまう
- ユーザーをアバター登録出来るようにしDBも増やし「誰のために作ったか」というコミュニテイ活動の発展に繋げる
- dockerの導入もまだ不十分なので知識を増やして実装する　　　ローカル環境は完了

#  最後に
　私は、お店を巡るのが好きで友人とよく行くですが、その時の情報取得の一つとして口コミを見ます。店選びで後悔したくはなく、ついつい色々と長く口コミを見てしまい選ぶのに時間がかかってしまう事が多々あります。それを解消するにはまずは、ある程度信用出来てなおかつ自分も行きたいと思える人の情報だけをピックアップするサイトがあれば良いと考えたのがキッカケで作成に当たりました。信用されれば人が集まり、そこから活発に意見交換が出来るようなサイトにする事が今の目標です。その為には「今後の課題」のコミュニティ形成が出来るような機能が必要で、出来るためにどんどん進めていきたいです。
私は勉強会にもよく参加していて、アプリ作成の参考にDB設計の会に参加して実際にある大手サイトを元にチーム分けして作ったのですが、チーム毎にテーブルやカラムの内容が相違があり面白く、そこからDB設計の参考にして行きました。そう行った場で自分の作品も見ていただく機会も作っていただいてるのですが、実装機能ではなくフィードバックとして何を誰のために作ったのかを聞かれる事が多く、技術以外の5Wの部分も考えなければいけないと感じました。今後もそのことを踏まえてアプリを作って行きたいです。まだまだ模擬サイトには見た目も、機能も追いついていないというのが実情ですが要所要所では似た実装ができている部分もあり、まだまだ技術力の向上が必要だと感じるが最初にアプリケーション、プログラミング学習を始めた時に比べて少しばかり成長は感じています。勉強しなければいけない所は多すぎることに逆にやりがいを感じていてこれからもそのスピードを落とさず精進して参りたいです。