class MedicinesController < ApplicationController
  def new
    @medicine=Medicine.new
  end
  
  def create
   # @name = params[:name]
    permitted_params = params.require(:medicine).permit(:name,:effect)
    medicine = Medicine.new(permitted_params)
    medicine.save
    redirect_to "/medicines/new"
   #@Note=Note.new
   # @Note.name="aa"
  #  @Note.effect="aa"
  end
  def index
  @medicines=Medicine.all
  end
  def show
  end
end
