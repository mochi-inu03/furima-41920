# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| last_name          | string              | null: false               |
| read_first         | string              | null: false               |
| read_last          | string              | null: false               |
| birth_day          | date                | null: false               |

### Association

* has_many : items
* has_many : orders

## items table

| Column                   | Type                | Options                        |
|--------------------------|---------------------|--------------------------------|
| user                     | references          | null: false, foreign_key: true |
| item_name                | string              | null: false                    |
| item_description         | text                | null: false                    |
| category_id              | integer             | null: false                    |
| condition_id             | integer             | null: false                    |
| shipping_fee_burden_id   | integer             | null: false                    |
| prefecture_id            | integer             | null: false                    |
| shipping_day_id          | integer             | null: false                    |
| price                    | integer             | null: false                    |

### Association

* has_one : order
* belongs_to : user

## order_addresses table

| Column                   | Type                | Options                        |
|--------------------------|---------------------|--------------------------------|
| order                    | references          | null: false, foreign_key: true |
| post_code                | string              | null: false                    |
| prefecture_id            | integer             | null: false                    |
| city                     | string              | null: false                    |
| address_line             | string              | null: false                    |
| building_name            | string              |                                |
| phone_number             | string              | null: false                    |

### Association

* belongs_to : order

## orders table

| Column                   | Type                | Options                        |
|--------------------------|---------------------|--------------------------------|
| user                     | references          | null: false, foreign_key: true |
| item                     | references          | null: false, foreign_key: true |

### Association

* belongs_to : item
* belongs_to : user
* has_one : order_address