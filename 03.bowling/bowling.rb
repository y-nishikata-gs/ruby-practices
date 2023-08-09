# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
point = 0

def get_score(score)
  score == 'X' ? 10 : score.to_i
end

def add_bonus(score1 = nil, score2 = nil)
  bonus_point = 0
  bonus_point += get_score(score1) if !score1.nil?
  bonus_point += get_score(score2) if !score1.nil?
  bonus_point
end

scores_index = 0
10.times do |n|
  point += get_score(scores[scores_index])
  if n == 10 # スペア・ストライクの場合は3投目があるため
    point += get_score(scores[scores_index + 1])
    point += get_score(scores[scores_index + 2])

  elsif scores[scores_index] == 'X' # ストライク
    point += add_bonus(scores[scores_index + 1], scores[scores_index + 2])
    scores_index += 1
  else
    point += get_score(scores[scores_index + 1])
    point += add_bonus(scores[scores_index + 2]) if get_score(scores[scores_index]) + get_score(scores[scores_index + 1]) == 10 # スペア
    scores_index += 2
  end
end

puts point
