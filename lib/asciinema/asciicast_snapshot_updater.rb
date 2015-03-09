require 'asciinema/film'


class AsciicastSnapshotUpdater

  def update(asciicast, at_seconds = nil)
    at_seconds ||= asciicast.snapshot_at || asciicast.duration / 2
    snapshot = generate_snapshot(asciicast, at_seconds)
    asciicast.snapshot = snapshot
  end

  private

  def generate_snapshot(asciicast, at_seconds)
    asciicast.with_terminal do |terminal|
      Film.new(asciicast.stdout, terminal).snapshot_at(at_seconds)
    end
  end

end
