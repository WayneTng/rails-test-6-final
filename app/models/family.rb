class Family < ActiveRecord::Base
  belongs_to :first_family_member, class_name: People
  belongs_to :second_family_member, class_name: People
end
