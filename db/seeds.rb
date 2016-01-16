# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts '=== Reset Database ==='
People.destroy_all
Family.destroy_all

puts '=== Create People Seed'
john = People.create!(first_name: 'John', last_name: 'Fwz', age: 40, gender: 'Male')
lily = People.create!(first_name: 'Lily', last_name: 'Fwz', age: 38, gender: 'Female')
william = People.create!(first_name: 'William', last_name: 'Fwz', age: 20, gender: 'Male')
michael = People.create!(first_name: 'Michael', last_name: 'Fwz', age: 18, gender: 'Male')
ava = People.create!(first_name: 'Ava', last_name: 'Fwz', age: 16, gender: 'Female')
mia = People.create!(first_name: 'Mia', last_name: 'Fwz', age: 14, gender: 'Female')

Family.create!(first_family_member_id: john.id, second_family_member_id: william.id, role: 'Father')
Family.create!(first_family_member_id: john.id, second_family_member_id: michael.id, role: 'Father')
Family.create!(first_family_member_id: john.id, second_family_member_id: ava.id, role: 'Father')
Family.create!(first_family_member_id: john.id, second_family_member_id: mia.id, role: 'Father')

Family.create!(first_family_member_id: lily.id, second_family_member_id: william.id, role: 'Mother')
Family.create!(first_family_member_id: lily.id, second_family_member_id: michael.id, role: 'Mother')
Family.create!(first_family_member_id: lily.id, second_family_member_id: ava.id, role: 'Mother')
Family.create!(first_family_member_id: lily.id, second_family_member_id: mia.id, role: 'Mother')

Family.create!(first_family_member_id: william.id, second_family_member_id: john.id, role: 'Son')
Family.create!(first_family_member_id: william.id, second_family_member_id: lily.id, role: 'Son')
Family.create!(first_family_member_id: william.id, second_family_member_id: michael.id, role: 'Brother')
Family.create!(first_family_member_id: william.id, second_family_member_id: ava.id, role: 'Sister')
Family.create!(first_family_member_id: william.id, second_family_member_id: mia.id, role: 'Sister')

Family.create!(first_family_member_id: michael.id, second_family_member_id: john.id, role: 'Son')
Family.create!(first_family_member_id: michael.id, second_family_member_id: lily.id, role: 'Son')
Family.create!(first_family_member_id: michael.id, second_family_member_id: william.id, role: 'Brother')
Family.create!(first_family_member_id: michael.id, second_family_member_id: ava.id, role: 'Sister')
Family.create!(first_family_member_id: michael.id, second_family_member_id: mia.id, role: 'Sister')

Family.create!(first_family_member_id: ava.id, second_family_member_id: john.id, role: 'Daughter')
Family.create!(first_family_member_id: ava.id, second_family_member_id: lily.id, role: 'Daughter')
Family.create!(first_family_member_id: ava.id, second_family_member_id: william.id, role: 'Brother')
Family.create!(first_family_member_id: ava.id, second_family_member_id: michael.id, role: 'Brother')
Family.create!(first_family_member_id: ava.id, second_family_member_id: mia.id, role: 'Sister')

Family.create!(first_family_member_id: mia.id, second_family_member_id: john.id, role: 'Daughter')
Family.create!(first_family_member_id: mia.id, second_family_member_id: lily.id, role: 'Daughter')
Family.create!(first_family_member_id: mia.id, second_family_member_id: william.id, role: 'Brother')
Family.create!(first_family_member_id: mia.id, second_family_member_id: michael.id, role: 'Brother')
Family.create!(first_family_member_id: mia.id, second_family_member_id: ava.id, role: 'Sister')
