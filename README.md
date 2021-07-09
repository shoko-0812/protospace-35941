# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| password           | string | null: false |
| name               | string | null: false |
| profile            | string | null: false |
| occupation         | string | null: false |
| position           | string | null: false |

### Association

- has_many :prototypes
- has_many :comments


## prototypes テーブル

| Column       | Type       | Options                        |
| ------------ | -----------| -------------------------------|
| title        | string     | null: false                    |
| catch_copy   | string     | null: false                    |
| image        |            |                                |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one_attached :image


## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       |                                |
| user         | references | null: false, foreign_key: true |
| prototype    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype





This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
