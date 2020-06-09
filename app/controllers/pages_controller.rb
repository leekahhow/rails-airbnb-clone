class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :disable_nav, only: [:home]  if: :current_user =! nil
  def home
  end
end
