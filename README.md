# アプリ名
## Chat in Tokyo!

# 概要
このアプリでは、ログイン/会員登録をしたユーザーは誰でもチャットルームを作成してチャットを開始、または既存のチャットルームに参加することができます。
<br>チャットルームは常時削除、ルーム名編集が可能です。　また、ユーザー情報に関しても編集が可能です。

# 本番環境
https://original-app-31104.herokuapp.com
<br>ログイン情報（テスト用）
<br>メールアドレス: ccc@sample.com
<br>パスワード: 123aaa

# 制作背景（意図）
コロナ禍の中で生活する在日外国人は、言語や情報収集手段の問題で、私たちが想像する以上に不便、孤独な思いをしている人が多いと思います。
日本で生活する上で快適に過ごすためには、コミュニティを見つけたりして人と繋がることが大事だと思います。
<br>そこで、他言語でも容易に情報収集、コミュニケーションすることができ、より簡単に、安全に人と繋がることができるアプリケーションがあれば、在日外国人の生活に貢献できるのではないかと思い、このアプリを開発を実装いたしました。

# DEMO
### トップページ
トップページからチャットページへ遷移するには、ログインまたは新規登録が必須です。
仮にログインしていないユーザーが直接ログイン先のURLを入力しても、このトップページへ遷移します。
<img src="https://github.com/Kanako-I/original-app/blob/master/app/assets/toppage.png?raw=true" >

### 新規登録ページ、ログインページ
新規登録ページには、名前、メールアドレス、パスワードの他に、居住区、年齢、職業を選択する項目があります。
ログインの際は、メールアドレスとパスワードの入力のみでログイン可能です。
<img src="https://github.com/Kanako-I/original-app/blob/master/app/assets/signin.png?raw=true" >
<img src="https://github.com/Kanako-I/original-app/blob/master/app/assets/login.png?raw=true" >

### チャットページ
チャットページでは、誰でも既存のチャットに参加することができ、自分でチャットグループを作成することもできます。
チャットの作成者は、いつでもグループ名の編集、およびグループの削除をすることができます。
<img src="https://github.com/Kanako-I/original-app/blob/master/app/assets/chat.png?raw=true" >

### チャットルーム新規作成、編集ページ
英語での説明書きとなりますが、新規作成ページには、「ルーム名は会話の内容がわかりやすいものにしてください。」「会話の内容が変わった場合は、定期的にルーム名を変えてください。」という注意書きを入れています。これは、他のユーザーがルーム名を見ただけでそのルームのチャット内容を把握できるようにするためです。
<img src="https://github.com/Kanako-I/original-app/blob/master/app/assets/roomcreate.png?raw=true" >
<img src="https://github.com/Kanako-I/original-app/blob/master/app/assets/roomedit.png?raw=true" >

# 工夫したポイント
会員登録およびページの閲覧機能です。
<br>チャットアプリは会員制ですが、新規登録の際、メールアドレスやパスワード設定だけでなく、年齢や在住地等（東京都民を対象としているので23区名をActiveHashで一覧表示）の入力が必須です。
<br>また、ログイン後のページの閲覧に関しては、もしログインしていないユーザーが仮に直接URLを入力してページに飛ぼうとしても、トップページに遷移するよう設定しています。
<br>これらにより、より安心、安全にユーザーがチャットアプリを利用できるようにしました。

# 使用技術（開発環境）
## バックエンド
Ruby, Ruby on Rails
## フロントエンド
HTML, CSS
## データベース
MySQL
## アプリケーションサーバー（本番環境）
Heroku
## ソース管理
GitHub, GitHubDesktop
## エディタ
VSCode

# 課題や今後実装したい機能
メッセージを送信する際の非同期通信を追加実装したいと思っています。この実装により、実際のチャットアプリケーションにより近づけるからです。

# テーブル設計

## users テーブル
| Column         | Type    | Options                   |
| -------------  | ------- | ------------------------- |
| first_name     | string  | null: false               |
| last_name      | string  | null: false               |
| email          | string  | null: false, unique: true |
| password       | string  | null: false               |
| resident       | integer | null: false               |
| age            | integer | null: false               |
| occupation     | integer | null: false               |
### Association
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages



## rooms テーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
### Association
- has_many :room_users
- has_many :users, through: room_users
- has_many :messages



## room_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |
### Association
- belongs_to :room
- belongs_to :user



## messages テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user
