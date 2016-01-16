class Mother < Family
  include FamilyValidation

  validate :cannot_younger_than_18

  def cannot_younger_than_18
    cannot_younger_than(18, 'Mother')
  end
end
