# frozen_string_literal: true

class ImagesController < ApplicationController
  before_action :find_shot, only: :create

  # POST /projects/:project_id/shots/:id/images
  def create
    if @shot.images.attach(params[:images])
      render json: @shot
    else
      render json: @shot.errors, status: :unprocessable_entity
    end
  end

  private

  def find_shot
    @shot = Shot.find(params[:shot_id])
  end
end
