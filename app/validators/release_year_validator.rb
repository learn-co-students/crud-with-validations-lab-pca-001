class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    return unless record.release_year.to_i > Time.now.year

    record.errors[:release_year] << "Release year cannot be in the future"
  end
end
