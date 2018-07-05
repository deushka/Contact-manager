# id:integer
# user_id:integer
# name:string
# surname:string
# email:string
# phone:string
# optional:text
class Contact < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true
  validates :phone, presence: true
end
