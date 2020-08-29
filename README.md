# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday_id      | date    | null: false |

### Association

- has_many :items
- has_many :sold_items

## items テーブル

| Column            | Type       | Options                        |
| ----------------  | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| description       | string     | null: false                    |
| category_id       | integer    | null: false                    |
| status_id         | integer    | null: false                    |
| cover_expenses_id | integer    | null: false                    |
| area_id           | integer    | null: false                    |
| delivery_time_id  | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :sold_item
#### 商品画像の添付には、Active Storageを使用します


## sold_items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postal_code           | integer    | null: false                    |
| prefectures           | integer    | null: false                    |
| city                  | integer    | null: false                    |
| address               | integer    | null: false                    |
| building_name         | integer    |                                |
| phone_number          | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item