class Song < ApplicationRecord
  include ActiveModel::Validations
  validates_with ReleaseYearValidator
  validates :title, presence: true, uniqueness: {scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validates :artist_name, presence: true

  def released?
    released == true
  end
end
