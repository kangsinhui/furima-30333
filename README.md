# README

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| name         | string | null: false |
| birthday     | string | null: false |

### Association

- has_many :items
- has_many :cards



## items テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| image              |             |                                |
| name               | string      | null: false                    |
| description        | string      | null: false                    |
| category           | string      | null: false                    |
| condition          | string      | null: false                    |
| cost               | string      | null: false                    |
| area               | string      | null: false                    |
| days               | string      | null: false                    |
| price              | string      | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_one : card



## cards テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| card_id            | string      | null: false                    |
| expiration_date    | string      | null: false                    |
| security_code      | string      | null: false                    |
| user               | references  | null: false, foreign_key: true |
| item               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many : destinations



## destinations テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| postal_code        | string      | null: false                    |
| prefectures        | string      | null: false                    |
| city               | string      | null: false                    |
| address            | string      | null: false                    |
| building_name      | string      | null: false                    |
| phone_number       | string      | null: false                    |
| card               | references  | null: false, foreign_key: true |

### Association

- belongs_to :card