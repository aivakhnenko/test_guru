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
    allowed_attrs = 
      case params[:badge][:badge_type]
      when '0' then %i[name image_url]
      when '1' then %i[name image_url category_id]
      when '2' then %i[name image_url level]
      end
    params.require(:badge).permit(*allowed_attrs).merge(badge_type: params[:badge][:badge_type].to_i)
  end

  def rescue_with_badge_not_found
    redirect_to admin_path, alert: t('admin.badges.rescue_with_badge_not_found.alert')
  end
end
