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

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false, unique: true|
|email|string|nul: false, unique: true|

### Association
- has_many :tweets
- has_many :comments

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|string|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル

|Column|Type|Opption|
|------|----|-------|
|text|text|null: false|
|image|string|
|user_id|integer|null: false, foreign_key: true|
|tweet_id||integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet

