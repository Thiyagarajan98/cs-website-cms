class Member < ApiModel
  attr_accessor :id, :name, :profile_pic, :attributes,
    :challenges_entered, :active_challenges, :time_zone,
    :total_1st_place, :total_2nd_place, :total_3st_place,
    :total_wins, :total_public_money, :total_points, :valid_submissions,
    :summary_bio, :quote,
    :first_name, :last_name, :email, :address_line1, :address_line2, :city, :zip, :state, :phone_mobile, :time_zone, :country,
    :preferred_payment, :paperwork_received, :paperwork_sent, :paperwork_year, :paypal_payment_address,
    :company, :school, :years_of_experience, :work_status, :shirt_size, :age_range, :gender,
    :website, :twitter, :github, :facebook, :linkedin

  has_many :recommendations
  has_many :challenges, parent: Member
  has_many :payments
  has_many :referrals

  def self.api_endpoint
    "#{ENV['CS_API_URL']}/members"
  end

  # Used for resourceful routes (instead of id)
  def to_param
    name
  end

  def self.search(keyword)
    request(:get, "search", {:keyword => keyword})
      .map {|member| Member.new member}
  end

  def self.login_type(membername)
    request(:get, "#{membername}/login_type", nil)
  end

end
