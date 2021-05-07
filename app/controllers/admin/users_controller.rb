class Admin::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end


  def create
    super
    if resourse.save
      @verifier = Verifier.find_all_by_user_id(resourse.id)
      @verifier.user_id = resourse.id
      @verifier.save
    else
      render :new
    end
  end


  def update
    super
  end
end
