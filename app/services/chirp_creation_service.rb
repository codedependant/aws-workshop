class ChirpCreationService
  def create(params)
    user_name = params.delete(:user_name)
    user = User.find_or_create_by_name!(user_name)
    Chirp.create(params.merge(:user_id => user.id))

  end

  def create!(params)
    cw ||= AWS::CloudWatch.new
    cw.put_metric_data(
      :namespace => 'chirps',
      :metric_data => [
        { :metric_name => 'chirp', :value => 1 }
      ]
    )
    chirp = create(params)
    chirp.save!
    chirp
  end
end
