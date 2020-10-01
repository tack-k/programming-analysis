# README

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

* テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| username           | string  | null: false              |
| email              | string  | null: false              |
| passwordencrypted_ | string  | null: false              |
| result             | string  | null: false, active hash |


### Association

- has_one :rooms
- has_many :messages

## admins テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| name               | string  | null: false              |
| email              | string  | null: false              |
| passwordencrypted_ | string  | null: false              |


### Association

- has_many :room_admins
- has_many :rooms, through: room_admins
- has_many :messages

## rooms テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |

### Association

- has_many :room_admins
- has_many :admins, through: room_admins
- belongs_to :users
- has_many :messages

## room_admins テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| admin  | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :admin

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | text       | null: false                    |
| admin   | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :admin
- belongs_to :user

## studies テーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| method  | string | null: false |
| content | text   | null: false |
| reason  | text   | null: false |
| price   | string | null: false |
| url     | text   | null: false |