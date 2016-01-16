class Father < Family
  include FamilyValidation
  validate :cannot_younger_than_20

  def cannot_younger_than_20
    cannot_younger_than(20, 'Father')
  end
end
