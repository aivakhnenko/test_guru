class Admin::BadgesController < ApplicationController
  before_action :find_badge, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_badge_not_found

  def index;
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to [:admin, @badge], notice: t('.notice_success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge], notice: t('.notice_success')
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy!
    redirect_to admin_tests_path, notice: t('.notice_success')
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    case (params[:badge][:badge_type_id])
    when '1' then params.require(:badge).permit(:name, :image_url, :badge_type_id)
    when '2' then params.require(:badge).permit(:name, :image_url, :badge_type_id, :category_id)
    when '3' then params.require(:badge).permit(:name, :image_url, :badge_type_id, :level)
    end
  end

  def rescue_with_badge_not_found
    redirect_to admin_path, alert: t('admin.badges.rescue_with_badge_not_found.alert')
  end
end
