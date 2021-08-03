# テーブル設計

## usersテーブル

|  Column            |   Type    | Option     |
|--------------------|-----------|------------|
| nickname           | string    | null: false|
| encrypted_password | string    | null: false|
| first_name         | string    | null: false|
| last_name          | string    | null: false|
| email              | string    | null: false|

### Association

- has_many :books
- has_many :comments

## commentsテーブル

|   Column           |    Type    |    Option      |
|--------------------|------------|----------------|
| info               | text       | null: false    |
| price              | integer    | null: false    |
| published_on       | string     | null: false    |
| author_name        | string     | null: false    |
| category           | string     | null: false    |
| appearance         | integer    | null: false    |
| user               | references | null: false , foreign_key: true |

### Association

- has_many :comments
- belongs_to :user

## commentsテーブル

|   Column          |      Type      |     Option       |
|-------------------|----------------|------------------|
| comment           | text           | null: false      |
| user              | references     | null: false , foreign_key: true |
| book              | references     | null: false , foreign_key: true |

### Association

- belongs_to :user
- belongs_to :book

