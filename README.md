# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |

### Association

- has_many :items
- has_one :purchase

## items テーブル

| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| title             | text         | null: false                    |
| product_condition | text         | null: false                    |
| catch_copy        | integer      | null: false                    |
| delivery_charge   | integer      | null: false                    |
| user              | references   | null: false, foreign_key: true |
| purchase          | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase
- has_many :item_tags

## tags テーブル

| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| tag               | string       | null: false                    |

### Association

- has_many :item_tags

## item_tags テーブル

| Column      | Type       | Options                        |
| ----------- | -----------| ------------------------------ |
| item_id     | references | null: false, foreign_key: true |
| tag_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :tag

## purchases テーブル

| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| first_name        | string       | null: false                    |
| last_name         | string       | null: false                    |
| birth_date        | integer      | null: false                    |
| shipment_id       | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items
- has_many :shipments

## shipments テーブル

| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| post_code         | integer      | null: false                    |
| address           | string       | null: false                    |
| telephone_number  | integer      | null: false                    |

### Association

- belongs_to :purchase