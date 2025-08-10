# README

## users

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| nickname           | string	    | null: false |
| email	             | string	    | null: false, unique: true |
| encrypted_password | string     | null: false |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| last_name_kana     | string     | null: false |
| first_name_kana    | string     | null: false |
| birth_date         | date       | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchased_records


## items

| Column              | Type       | Options     |
|---------------------|------------|-------------|
| item                | string	   | null: false |
| description         | text       | null: false |
| category_id         | integer    | null: false |
| condition_id        | integer    | null: false |
| bearer_id           | integer    | null: false |
| ship_from_address_id| integer    | null: false |
| shipping_time_id    | integer    | null: false |
| price               | integer    | null: false |
| sales_status        | integer    | null: false, default: 0 |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchased_record
- has_many :comments


## comments

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| comment            | text       | null: false |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user


## purchased_records

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association
- has_one :shipping_address
- belongs_to :item
- belongs_to :user

## shipping_addresses

| Column             | Type       | Options     |
|--------------------|------------|-------------|
| postal_code        | string	    | null: false |
| prefecture_id      | integer    | null: false |
| municipality       | string     | null: false |
| house_number       | string     | null: false |
| building           | string     |             |
| phone_number       | string     | null: false |
| purchased_record   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchased_record