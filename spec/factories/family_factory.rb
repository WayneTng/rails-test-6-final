FactoryGirl.define do
  factory :family do
    type 'Father'
    first_family_member_id { create(:people) }
    second_family_member_id { create(:people) }
  end
end
