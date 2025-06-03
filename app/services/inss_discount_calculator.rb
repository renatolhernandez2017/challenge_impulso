class InssDiscountCalculator
  def self.call(salary)
    tracks = SalaryTracks::TRACKS
    salary = salary.to_f
    discount = 0.0
    previous_track = 0.0

    tracks.each do |track|
      if salary > track[:track_max]
        base = track[:track_max] - previous_track
      else
        base = salary - previous_track
      end

      break if base <= 0

      discount += base * track[:aliquot]
      previous_track = track[:track_max]
    end

    discount.round(2)
  end
end
