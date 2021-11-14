class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @comments = Comment.all.order(created_at: :desc)
  end
  
  
end
