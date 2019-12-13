class ArtistsController < ApplicationController
    before_action :find_artist, only: [:show, :edit, :update]


    def show
        
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(permit_artist)
        redirect_to artist_path(@artist)
    end

    def edit

    end

    def update
        @artist.update(permit_artist)
        redirect_to artist_path(@artist)
    end

    private

    def find_artist
        @artist = Artist.find(params.require(:id))
    end

    def permit_artist
        params.require(:artist).permit(:name, :bio)
    end

end
