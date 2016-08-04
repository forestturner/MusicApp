class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null:false
      t.integer :number_on_tack, null: false
      t.boolean :bonus, default: false, null: false
      t.text :lyrics, null: false
      t.timestamps
    end
    add_index :tracks, [:album_id,:number_on_tack], unique: true
  end
end


# Table name: albums
#
#  asin        :string       not null, primary key
#  title       :string
#  artist      :string
#  price       :float
#  rdate       :date
#  label       :string
#  rank        :integer
#
# Table name: styles
#
# album        :string       not null
# style        :string       not null
#
# Table name: tracks
# album        :string       not null
# disk         :integer      not null
# posn         :integer      not null
# song         :string
