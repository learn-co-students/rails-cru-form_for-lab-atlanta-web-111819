class ArtistsController < ApplicationController
    def index
        @artists = Artist.all 
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(post_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    def show
        select_artist
        @songs = @artist.songs
    end

    def edit
        select_artist
    end

    def update
        select_artist
        @artist.update(post_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private

    def select_artist
        @artist = Artist.find(params[:id])
    end

    def post_params(*args)
        params.require(:artist).permit(*args)
    end
end
