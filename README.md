# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| name_kanji         | string  | null: false |
| name_kana          | string  | null: false |
| birthday           | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| title             | text         | null: false                    |
| description       | text         | null: false                    |
| category          | string       | null: false                    |
| product_condition | text         | null: false                    |
| burden            | string       | null: false                    |
| area              | string       | null: false                    |
| day               | string       | null: false                    |
| price             | integer      | null: false                    |
| user_id           | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_many :item_tags

## evaluations テーブル

| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| favorite          | boolean      | null: false                    |
| report            | text         | null: false                    |
| comment           | text         | null: false                    |
### Association

- has_many :item_evaluations

## item_evaluations テーブル

| Column        | Type       | Options                        |
| ------------- | -----------| ------------------------------ |
| item_id       | references | null: false, foreign_key: true |
| evaluation_id | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :tag

## purchases テーブル

| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| user_id           | references   | null: false, foreign_key: true |
| item_id           | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many :shipments

## shipments テーブル

| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| post_code         | integer      | null: false                    |
| prefectures       | string       | null: false                    |
| municipalities    | string       | null: false                    |
| address           | string       | null: false                    |
| building          | string       | null: true                     |
| telephone_number  | integer      | null: false                    |
| purchase_id       | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase