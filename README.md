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
  has_many :community_messages
  has_many :rent_messages
  has_many :buy_sell_messages


## community_messages テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | string     |                                |
| user      | references | null: false, foreign_key: true |
### Association
- has_many :users


## rent_messages テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | string     |                                |
| user      | references | null: false, foreign_key: true |
### Association
- has_many :users


## buy_sell_messages テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | string     |                                |
| user      | references | null: false, foreign_key: true |
### Association
- has_many :users
