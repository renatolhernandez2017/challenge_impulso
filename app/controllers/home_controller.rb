class HomeController < ApplicationController
  include Pagy::Backend

  def index
    @tracks = SalaryTracks::TRACKS
    proponents = Proponent.all

    grouped_by_range = proponents.group_by { |p| salary_range(p.salary) }

    @proponents = grouped_by_range.map do |track, proponents|
      {
        track: track,
        quantity: proponents.count
      }
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
