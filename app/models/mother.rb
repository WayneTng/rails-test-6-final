class Mother < Family
  include FamilyValidation

  validate :cannot_younger_than_18, :must_be_female

  def cannot_younger_than_18
    cannot_younger_than(18, 'Mother')
  end
end
