require "debug"
require "rubocop"

score = ARGV[0]
scores = score.split(',')
point = 0

# スコアを評価してストライクであれば変換する
def convert_score(score)
  if score == "X"
    return 10
  else
    return score.to_i
  end
end

# ストライクのボーナス点を加算
def add_strike(score1, score2)
  bonus_point = 0
  bonus_point += convert_score(score1)
  bonus_point += convert_score(score2)
  return bonus_point
end

# スペアのボーナス点を加算
def add_spare(score1)
  bonus_point = 0
  bonus_point += convert_score(score1)
  return bonus_point
end

frame = 1 # nフレーム目（2投で1セット）
i = 0 # scoresのインデックス
while frame <= 10
  if frame == 10 #10フレーム目のみストライク・スペアボーナスはない
    point += convert_score(scores[i])
    point += convert_score(scores[i + 1])
    point += convert_score(scores[i + 2])
    i += 1
  else
    if scores[i] == "X" # ストライク
      point += 10
      point += add_strike(scores[i + 1], scores[i + 2])
      i += 1
    else
      point += scores[i].to_i
      point += scores[i + 1].to_i

      if scores[i].to_i + scores[i + 1].to_i == 10 # スペア
        point += add_spare(scores[i + 2])
      end
      i += 2
    end
  end
  frame += 1
end

puts point