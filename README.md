#　テーブル設計

## users テーブル

| Column                 | Type     | Options                   |
| ---------------------- | -------- | ------------------------- |
| nickname               | string   | null: false               |
| email                  | string   | null: false, unique: true |
| encrypted_password     | string   | null: false               |
| first_name             | string   | null: false               |
| last_name              | string   | null: false               |
| first_name_kana        | string   | null: false               |
| last_name_kana         | string   | null: false               |
| birthday               | datetime | null: false               |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column                 | Type     | Options                   |
| ---------------------- | -------- | ------------------------- |
| image                  | string   | null: false               |
| name                   | string   | null: false               |
| description            | text     | null: false               |
| category_id            | integer  | null: false               |
| status_id              | integer  | null: false               |
| value                  | integer  | null: false               |
| user                   | references | foreign_key: true       |

### Association
- belongs_to :user
- has_one :orders


## orders テーブル

| Column                 | Type     | Options                   |
| ---------------------- | -------- | ------------------------- |
| user_id                | integer  | null: false               |
| item_id                | integer  | null: false               |
| status                 | string   | null: false, default: 0   |
| total_value            | integer  | null: false               |
| shipping_date          | datetime | null: false               |

### Association
- belongs_to :user
- has_one :item
- has_one :addresses


## addresses テーブル

| Column                 | Type     | Options                   |
| ---------------------- | -------- | ------------------------- |
| user_id                | integer  | null: false               |
| postal_code            | string   | null: false               |
| prefecture             | string   | null: false               |
| city                   | string   | null: false               |
| address_line           | string   | null: false               |
| building               | string   |                           |
| phone_number           | string   | null: false               |

### Association
- has_one :order