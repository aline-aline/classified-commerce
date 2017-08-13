class Site::Profile::AdsController < Site::ProfileController

  def index
    @ads = Ad.where(current_member)
  end
end
