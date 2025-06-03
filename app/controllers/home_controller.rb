class HomeController < ApplicationController
  include Pagy::Backend

  def index
    @tracks = SalaryTracks::TRACKS
    proponents = Proponent.all

    grouped = proponents.group_by { |p| salary_range(p.salary) }

    track_order = @tracks.map { |t| t[:name] }

    @proponents = track_order.map do |track|
      {
        track: track,
        quantity: grouped[track]&.count.to_i
      }
    end

    above_max = grouped.keys - track_order
    above_max.each do |track|
      @proponents << { track: track, quantity: grouped[track].count }
    end
  end

  def salary_range(salary)
    previous = 0

    @tracks.each do |track|
      return track[:name] if salary <= track[:track_max]
      previous = track[:track_max]
    end

    'Acima de R$7.786,02'
  end
end
