class TrackController < ApplicationController
  def new
    @track = Track.new
    render :new
  end
  def show
    @track = Track.find(params[:id])
    render :show
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to track_url
  end

  def updated
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to tracks_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end
  private
  def track_params
    params.require(:track).permit(:name,:album_id,:number_on_tack,:bonus,:lyrics)
  end
end

# create_table "tracks", force: :cascade do |t|
#   t.string   "name",                           null: false
#   t.integer  "album_id",                       null: false
#   t.integer  "number_on_tack",                 null: false
#   t.boolean  "bonus",          default: false, null: false
#   t.text     "lyrics",                         null: false
#   t.datetime "created_at",                     null: false
#   t.datetime "updated_at",                     null: false
#   t.index ["album_id", "number_on_tack"], name: "index_tracks_on_album_id_and_number_on_tack", unique: true, using: :btree
# end






#
# create_table "albums", force: :cascade do |t|
#   t.integer  "band_id",    null: false
#   t.string   "name",       null: false
#   t.boolean  "live",       null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["band_id"], name: "index_albums_on_band_id", unique: true, using: :btree
# end
#
# create_table "bands", force: :cascade do |t|
#   t.string   "name",       null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end
#
# create_table "tracks", force: :cascade do |t|
#   t.string   "name",                           null: false
#   t.integer  "album_id",                       null: false
#   t.integer  "number_on_tack",                 null: false
#   t.boolean  "bonus",          default: false, null: false
#   t.text     "lyrics",                         null: false
#   t.datetime "created_at",                     null: false
#   t.datetime "updated_at",                     null: false
#   t.index ["album_id", "number_on_tack"], name: "index_tracks_on_album_id_and_number_on_tack", unique: true, using: :btree
# end
#
# create_table "users", force: :cascade do |t|
#   t.string   "email",           null: false
#   t.string   "password_digest", null: false
#   t.string   "session_token",   null: false
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
#   t.index ["session_token"], name: "index_users_on_session_token", using: :btree
# end
