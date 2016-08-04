class Track < ApplicationRecord
  validates :name,:album_id,:number_on_tack, presence: true

  belongs_to :album,
  primary_key: :id,
  foreign_key: :album_id,
  class_name: :Album
end
