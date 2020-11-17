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
