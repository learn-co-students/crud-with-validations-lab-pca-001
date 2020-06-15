class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i(artist_name release_year),
    message: "Cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }

  with_options if: :released? do |release|
    release.validates :release_year, presence: true
    release.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
  end

  def released?
    released
  end

  validates :artist_name, presence: true
end
