class People < ActiveRecord::Base
  has_many :first_member,     class_name: Family, foreign_key: 'first_family_member_id'
  has_many :second_member, class_name: Family, foreign_key: 'second_family_member_id'

  validates :age, numericality: { only_integer: true, greater_than: 0 }

  def parents
    find_family_members(:father, :mother)
  end

  def children
    find_family_members(:son, :daughter)
  end

  def father
    def say_something
      'Hello, i am your father'
    end
    find_father_or_mother(:father)
  end

  def mother
    def say_something
      "Hello, i am your mother"
    end
    find_father_or_mother(:mother)
  end

  def sons
    def say_something
      'Hello, i am your son'
    end
    find_family_members(:son)
  end

  def daughters
    def say_something
      'Hello, i am your daughter'
    end
    find_family_members(:daughter)
  end

  def brothers
    find_family_members(:brother)
  end

  def sisters
    find_family_members(:sister)
  end

  def find_father_or_mother(type)
    Family.includes(:first_family_member).where('lower(type) = ? AND second_family_member_id = ?', type, self.id).first.first_family_member
  end

  def find_family_members(first_type, second_type = nil)
    members_array = []
    if first_type == 'sister' or first_type == 'brother'
      members = Family.includes(:first_family_member).where('(lower(type) = ? OR lower(type) = ?) AND first_family_member_id = ?', type, self.id)
    else
      members = Family.includes(:first_family_member).where('(lower(type) = ? OR lower(type) = ?) AND second_family_member_id = ?', first_type, second_type, self.id)
    end
    members.each do |member|
      members_array << member.first_family_member
    end
    members_array
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def say_something(relation = nil)
    if relation.present?
      "Hello, I am your #{relation}"
    else
      "Hello, my name is #{name}"
    end
  end

  def father_of?(name)
    name_id = People.where(first_name: name).first.id
    if name_id.present?
      father_of = Family.includes(:first_family_member).where('lower(type) = ? AND second_family_member_id = ?', :father, name_id)
    end
    father_of.present?
  end

  def older_than(name)
    name = People.where(first_name: name).first
    age_different = self.age - name.age
  end
end
