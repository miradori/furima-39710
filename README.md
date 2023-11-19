# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name_kanji   | string  | null: false |
| last_name_kanji    | string  | null: false |
| first_name_kana    | string  | null: false |
| last_name_kana     | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| title             | string       | null: false                    |
| description       | text         | null: false                    |
| category_id       | integer      | null: false                    |
| condition_id      | integer      | null: false                    |
| burden_id         | integer      | null: false                    |
| area_id           | integer      | null: false                    |
| day_id            | integer      | null: false                    |
| price             | integer      | null: false                    |
| user              | references   | null: false, foreign_key: true |

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
| item          | references | null: false, foreign_key: true |
| evaluation    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :tag

## purchases テーブル

| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| user              | references   | null: false, foreign_key: true |
| item              | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many :shipments

## shipments テーブル

| Column            | Type         | Options                        |
| ------------------| ------------ | ------------------------------ |
| post_code         | string       | null: false                    |
| prefectures_id    | integer      | null: false                    |
| municipalities    | string       | null: false                    |
| address           | string       | null: false                    |
| building          | string       | null: true                     |
| telephone_number  | string       | null: false                    |
| purchase          | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase