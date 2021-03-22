# README

# アパログ

## 概要
実際に店舗に訪れたユーザーが感想や写真を投稿しクチコミを公開することにより、お店の雰囲気を知ることができるアプリです。ネットショッピングが当たり前になる今日で、お店に足を運んで買い物をすることはちょっとしたイベントになりつつあります。その中で評判がいい店舗や話題のアパレル店を検索して、そのお店での買い物を楽しんでくれる人が増えて欲しいと思い作成をしました。また、お店での経験をクチコミされることにより、お店側もフィードバックを得られ業務の改善や新規顧客の獲得などにも役立つことを期待しています。

## コンセプト　
アパレルショップのクチコミ投稿ができるアプリ。

### バージョン情報
- Ruby 2.6.5
- Ruby on Rails 5.2.4
- PostgreSQL 13.1

### 機能一覧
* ログイン機能
* ユーザー登録機能
    - [x] メールアドレス、名前、パスワードは必須
* 店主登録機能
    - [x] メールアドレス、名前、パスワード、電話番号、郵便番号、会社名は必須
    - [x] 店舗の登録、編集、削除ができる
* 店検索機能
    - [x] カテゴリー検索でお店を絞って表示可能
    - [x] 星評価の平均点が高い順にソートができる
* フォロー機能
    - [x] ユーザー間でフォローが可能
* クチコミ機能
    - [x] ユーザーはお店に対してクチコミの投稿、評価、編集、削除ができる
* コメント機能
    - [x] 店主が自店舗のクチコミに対して返信メッセージを送ることができる
* ブラックリスト機能

    - [x] 店主が悪質ユーザーの投稿を制限できる


### デプロイ先
[Heroku](https://pure-meadow-89852.herokuapp.com/)


### 使用予定Gem
- device
- ransack
- rspec
- CarrierWave 
- mini_magick
- kaminari


[カタログ設計](https://docs.google.com/spreadsheets/d/1m6Y85sIV91KAMsDBUDWzHYiUWefnIoDbAsQiu2pH5UM/edit?usp=sharing)

[テーブル定義](https://docs.google.com/spreadsheets/d/1f4UbZ2V5TXXjc1OA1tuqDTseqqIlOhAbg9Qdbz257YQ/edit?usp=sharing)

[画面遷移図](https://docs.google.com/spreadsheets/d/1col-qSIgZlmYk7GGJOUVt_pqwbdtA3zd7wyMzstyk-4/edit?usp=sharing)

[ワイヤーフレーム](https://docs.google.com/spreadsheets/d/1sdzKW4l3MiczHkWrIbGB8qriUMmD8gCsSdL9RFc4pwk/edit?usp=sharing)
