# README

## messagesテーブル

|Column|Type|Options|
|------|------|------|
|body|text|------|
|image|string|------|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :group
- belongs_to :user

## usersテーブル

|Column|Types|Option|
|------|------|------|
|name|string|null: false, add_index :users, :name, unique: true|
|email|string|null: false, add_index :users, :email, unique: true|

### Association

- has_many :messages
- has_many :groups, through: :members
- has_many :members

## groupsテーブル

|Column|Type|Option|
|------|------|------|
|group_name|string|null: false, add_index :groups, :group_name, unique: true|

### association

- has_many :users, through: :members
- has_many :members
- has_many :messages

## membersテーブル（中間テーブル）

|Column|Type|Option|
|------|------|------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

