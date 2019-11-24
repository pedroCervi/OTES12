class Adapters::StatisticsServiceAdaptee
  STATISTICS_SERVICE_URL = 'http://8f943b0b.ngrok.io'.freeze
  NAMESPACE = 'numberlist'.freeze

  def save_numberlist(numbers)
    payload = {
      numberList: numbers
    }

    HTTParty.post(
      statistics_service_route,
      body: payload.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  rescue StandardError => e
    puts e
  end

  def sort_desc(id)
    HTTParty.get(
      "#{statistics_service_route}/sortdesc/#{id}",
      headers: { 'Content-Type' => 'application/json' }
    )
  rescue StandardError => e
    puts e
  end

  def average(id)
    HTTParty.get(
      "#{statistics_service_route}/average/#{id}",
      headers: { 'Content-Type' => 'application/json' }
    )
  rescue StandardError => e
    puts e
  end

  def median(id)
    HTTParty.get(
      "#{statistics_service_route}/median/#{id}",
      headers: { 'Content-Type' => 'application/json' }
    )
  rescue StandardError => e
    puts e
  end

  private

  def statistics_service_route
    if ENV['RAILS_ENV'] == 'production'
      ENV['NUMBERS_SERVICE_URL'] + '/' + ENV['NUMBERS_SERVICE_NAMESPACE']
    else
      STATISTICS_SERVICE_URL + '/' + NAMESPACE
    end
  end
end
