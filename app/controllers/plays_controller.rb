class PlaysController < ApplicationController
    before_action :find_plays, only: [:show,:edit,:update,:destroy]
    before_action :authenticate_user!, only: [:new, :edit]
    def index
        if params[:category].blank?
            @plays=Play.all.order("created_at DESC")
        else
            @category_id=Category.find_by(name: params[:category]).id
            @plays=Play.where(:category_id => @category_id).order("created_at DESC")
        end
    end
    def new
        @play=current_user.plays.build
        @categories=Category.all.map{ |c| [c.name, c.id]}
    end
    def create
        @play=current_user.plays.build(play_params)
        puts "#{play_params[:category_id]} debug"
        @play.category_id=play_params[:category_id]
        if @play.save
            flash[:notice]="Play cretaed successfully"
            redirect_to play_path(@play)
        else
            render :new, status: :unprocessable_entity
        end
    end
    def show
        @play=Play.find(params[:id])
    end
    def edit
        @categories=Category.all.map{ |c| [c.name, c.id]}
    end
    def update
        @play.category_id=params[:category_id]
        if @play.update(play_params)
            flash[:notice]="Play Updated Successfully"
            redirect_to play_path(@play)
        else
            render 'edit',status: :unprocessable_entity
        end
    end
    def destroy
        @play.destroy
        flash[:alert]= "Deleted Play!"
        redirect_to plays_path
    end

    private
    def play_params
        params.require(:play).permit(:title,:desc,:director,:main_image,:category_id)
    end
    def find_plays
        @play=Play.find(params[:id])
    end
end
