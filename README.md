#  テーブル設計

##  users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- | 
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| given_name      | string | null: false |
| first_name_kana | string | null: false |
| given_name_kana | string | null: false |
| birthday        | date   | null: false |

###  Association

- has_many :products
- has_many :buyings

##  products

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name　　　　　   　| string     | null: false                    |
| description      | text       | null: false                    |
| category         | text       | null: false                    |
| condition_id     | integer    | null: false                    |
| burden_id        | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | text       | null: false                    |
| user_id          | references | null: false, foreign_key: true |

###  Association

- belongs_to :user
- belongs_to :buying

##  buyings

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |

###  Association

- has_many :products
- belongs_to :user
- has_one :shipping_address

##  shipping_addresses

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | string  | null: false |
| prefecture   | integer | null: false |
| city         | string  | null: false |
| house_number | string  | null: false |
| building     | string  |             |
| phone_number | string  | null: false |

###  Association

- belongs_to :buying