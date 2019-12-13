class SongsController < ApplicationController

    before_action :find_song, only: [:show, :edit, :update]

    def index
        @songs = Song.all
    end


    def show

    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(permit_song)
        redirect_to song_path(@song)
    end

    def edit

    end

    def update
        @song.update(permit_song)
        redirect_to song_path(@song)
    end

    private

    def permit_song
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end

    def find_song
        @song = Song.find(params.require(:id))
    end


end
