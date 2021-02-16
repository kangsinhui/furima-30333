# README

## users テーブル

| Column                             | Type   | Options      |
| ---------------------------------- | ------ | ------------ |
| nickname                           | string | null: false  |
| email                              | string | unique: true |
| encrypted_password                 | string | null: false  |
| family_name                        | string | null: false  |
| first_name                         | string | null: false  |
| family_name_kana                   | string | null: false  |
| first_name_kana                    | string | null: false  |
| birthday                           | date   | null: false  |

### Association

- has_many :items
- has_many :cards



## items テーブル

| Column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| image                 |              |                                |
| name                  | string       | null: false                    |
| description           | string       | null: false                    |
| category_id           | integer      | null: false                    |
| condition_id          | integer      | null: false                    |
| cost_id               | integer      | null: false                    |
| area_id               | integer      | null: false                    |
| days_id               | integer      | null: false                    |
| price                 | integer      | null: false                    |
| user                  | references   | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_one : card



## cards テーブル

| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| user               | references  | null: false, foreign_key: true |
| item               | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : destination



## destinations テーブル

| Column                | Type         | Options                        |
| --------------------- | ------------ | ------------------------------ |
| postal_code           | string       | null: false                    |
| prefectures_id        | integer      | null: false                    |
| city                  | string       | null: false                    |
| address               | string       | null: false                    |
| building_name         | string       |                                |
| phone_number          | string       | null: false                    |
| card                  | references   | null: false, foreign_key: true |

### Association

- belongs_to :card