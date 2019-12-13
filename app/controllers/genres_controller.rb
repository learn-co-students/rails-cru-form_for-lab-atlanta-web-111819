class GenresController < ApplicationController
    before_action :find_genre, only: [:show, :edit, :update]


    def show

    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.create(permit_genre)
        redirect_to genre_path(@genre)
    end

    def edit

    end

    def update
        @genre.update(permit_genre)
        redirect_to genre_path(@genre)
    end

    private

    def permit_genre
        params.require(:genre).permit(:name)
    end

    def find_genre
        @genre = Genre.find(params.require(:id))
    end

end
