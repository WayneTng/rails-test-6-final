class People < ActiveRecord::Base
  has_many :first_member,     class_name: Family, foreign_key: 'first_family_member_id'
  has_many :second_member, class_name: Family, foreign_key: 'second_family_member_id'
end
