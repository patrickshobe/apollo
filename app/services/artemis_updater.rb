class ArtemisUpdater

  def initialize(artemis_id)
    @id = artemis_id
  end

  def update
    conn.put "api/v1/encode_records/#{@id}"
  end

  def self.ship_it(artemis_id)
    updater = new(artemis_id)
    updater.update
  end

  def conn
    Faraday.new(:url => ENV['ARTEMIS_PATH'] ) do |f|
      f.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end
