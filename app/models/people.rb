class People < ActiveRecord::Base
  has_many :first_member,     class_name: Family, foreign_key: 'first_family_member_id'
  has_many :second_member, class_name: Family, foreign_key: 'second_family_member_id'

  validates :age, numericality: { only_integer: true, greater_than: 0 }

  def parents
    family = []
    parents = Family.includes(:first_family_member).where('(lower(type) = ? OR lower(type) = ?) AND second_family_member_id = ?', :father, :mother, self.id)
    parents.each do |parent|
      family << parent.first_family_member
    end
    family
  end

  def children
    children = []
    families = Family.includes(:first_family_member).where('(lower(type) = ? OR lower(type) =?) AND second_family_member_id = ?', :son, :daughter, self.id)
    families.each do |family|
      children << family.first_family_member
    end
    children
  end

  def father
    def say_something
      'Hello, i am your father'
    end
    Family.includes(:first_family_member).where('lower(type) = ? AND (first_family_member_id = ? OR second_family_member_id = ?)', :father, self.id, self.id).first.first_family_member
  end

  def mother
    def say_something
      'Hello, i am your mother'
    end
    Family.includes(:first_family_member).where('lower(type) = ? AND (first_family_member_id = ? OR second_family_member_id = ?)', :mother, self.id, self.id).first.first_family_member
  end

  def sons
    def say_something
      'Hello, i am your son'
    end
    sons = []
    families = Family.includes(:first_family_member).where('lower(type) = ? AND (first_family_member_id = ? OR second_family_member_id = ?)', :son, self.id, self.id)
    families.each do |family|
      sons << family.first_family_member
    end
    sons
  end

  def daughters
    def say_something
      'Hello, i am your daughter'
    end
    daughters = []
    families = Family.includes(:first_family_member).where('lower(type) = ? AND (first_family_member_id = ? OR second_family_member_id = ?)', :daughter, self.id, self.id)
    families.each do |family|
      daughters << family.first_family_member
    end
    daughters
  end

  def brothers
    brothers = []
    families = Family.includes(:first_family_member).where('lower(type) = ? AND first_family_member_id = ?', :brother, self.id)
    families.each do |family|
      brothers << family.second_family_member
    end
    brothers
  end

  def sisters
    sisters = []
    families = Family.includes(:first_family_member).where('lower(type) = ? AND first_family_member_id = ?', :sister, self.id)
    families.each do |family|
      sisters << family.second_family_member
    end
   sisters
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def say_something
    "Hello, my name is #{name}"
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
