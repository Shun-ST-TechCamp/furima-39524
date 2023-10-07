# テーブル設計

## users テーブル

| Column                 | Type    | Options            |
| ---------------------- | ------- | ------------------ |
| nickname               | string  | null: false        |
| email                  | string  | null: false,unique |
| encrypted_password     | string  | null: false        |
| last_name_kanji        | string  | null: false        |
| fast_name_kanji        | string  | null: false        |
| last_name_kana         | string  | null: false        |
| fast_name_kana         | string  | null: false        |
| birth_year             | integer | null: false        |
| birth_month            | integer | null: false        |
| birth_day              | integer | null: false        |

### Association
- has_many :items

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| description            | text       | null: false                    |
| category               | string     | null: false                    |
| condition              | string     | null: false                    |
| postage                | string     | null: false                    |
| region                 | string     | null: false                    |
| until_shipping         | string     | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :shipping

## shippings テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| post_code              | string     | null: false                    |
| prefectures            | string     | null: false                    |
| municipality           | string     | null: false                    |
| street_address         | string     | null: false                    |
| building_name          | string     | null: true                     |
| phone                  | integer    | null: false                    |
| item                   | references | null: false, foreign_key: true |

### Association

- belongs_to :item