class Song < ApplicationRecord
  include ActiveModel::Validations
  validates :title, presence: true, uniqueness: { scope: :artist_name, scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released, numericality: { only_integer: true, less_than_or_equal_to: 2020 }
  validates :artist_name, presence: true

  def boolean_type?
    released.class == TrueClass || released.class == FalseClass
  end
end
