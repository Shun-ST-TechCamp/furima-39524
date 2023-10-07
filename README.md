# テーブル設計

## users テーブル

| Column                 | Type    | Options                  |
| ---------------------- | ------- | ------------------------ |
| nickname               | string  | null: false              |
| email                  | string  | null: false,unique: true |
| encrypted_password     | string  | null: false              |
| last_name_kanji        | string  | null: false              |
| fast_name_kanji        | string  | null: false              |
| last_name_kana         | string  | null: false              |
| fast_name_kana         | string  | null: false              |
| birth_day              | date    | null: false              |


### Association

- has_many :items
- has_many :buys

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| description            | text       | null: false                    |
| category               | integer    | null: false                    |
| condition              | integer    | null: false                    |
| postage                | integer    | null: false                    |
| region                 | integer    | null: false                    |
| until_shipping         | integer    | null: false                    |
| price                  | integer    | null: false                    |
| sold_out               | boolean    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy
- belongs_to :category
- belongs_to :condition
- belongs_to :postage
- belongs_to :region
- belongs_to :until_shipping

## buys テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping

## shippings テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| post_code              | string     | null: false                    |
| prefectures            | string     | null: false                    |
| municipality           | string     | null: false                    |
| street_address         | string     | null: false                    |
| building_name          | string     | null: true                     |
| phone                  | string     | null: false                    |
| buy                    | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
- belongs_to :prefecture