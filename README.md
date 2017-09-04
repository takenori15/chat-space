# README

##messagesテーブル

|Column|Type|Options|
|------|------|------|
|body|text|null: false|
|image|string|------|
|group_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

###Association

- belongs_to :group
- belongs_to :user

##usersテーブル

|Column|Types|Option|
|------|------|------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|

###Association

- has_many :messages
- has_many :groups, through: :members
- has_many :members

##groupsテーブル

|Column|Type|Option|
|------|------|------|
|group_name|string|------|

###association

- has_many :users, through: :members
- has_many :members

##membersテーブル（中間テーブル）

|Column|Type|Option|
|------|------|------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

###Association
- belongs_to :user
- belongs_to :group

