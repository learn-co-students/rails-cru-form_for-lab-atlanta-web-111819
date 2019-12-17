class SongsController < ApplicationController
    def index
        @songs = Song.all 
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(post_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    def show
        select_song
        @genre = @song.genre
        @artist = @song.artist
    end

    def edit
        select_song
    end

    def update
        select_song
        @song.update(post_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    private

    def select_song
        @song = Song.find(params[:id])
    end

    def post_params(*args)
        params.require(:song).permit(*args)
    end
end
