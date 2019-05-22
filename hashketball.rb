require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismack Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, player_data|
      if player == name
        return player_data[:points]
      end
    end
  end
end

def shoe_size(name)
  return find_player(name)[:shoe]
end

def find_player(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, player_data|
      if player == name
        return player_data
      end
    end
  end
  return nil
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_names << team_data[:team_name]
  end
  return team_names
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |player, player_data|
        numbers << player_data[:number]
      end
    end
  end
  return numbers
end

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_name == player
        return player_stats
      end
    end
  end
end

def big_shoe_rebounds
  max_size = nil
  largest_player_rebounds = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if max_size == nil || player_stats[:shoe] >= max_size
        max_size = player_stats[:shoe]
        largest_player_rebounds = player_stats[:rebounds]
      end
    end
  end
  return largest_player_rebounds
end

def most_points_scored
  most_points_player = nil
  most_points = nil
  game_hash.each do |team, team_data|
    team_data[:players].each do |player_name, player_stats|
      if most_points == nil || player_stats[:points] >= most_points
        most_points = player_stats[:points]
        most_points_player = player_name
      end
    end
  end
  return most_points_player
end

def winning_team
  most_points = nil
  most_points_team = nil
  game_hash.each do |location, team_data|
    total = 0
    team_data[:players].each do |player_name, player_stats|
      total += player_stats[:points]
    end
    if most_points_team == nil || total >= most_points
      most_points = total
      most_points_team = team_data[:team_name]
    end
  end
  return most_points_team
end

def player_with_longest_name
  max_length = nil
  max_player = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if max_length == nil || player_name.length >= max_length
        max_length = player_name.length
        max_player = player_name
      end
    end
  end
  return max_player
end

def long_name_steals_a_ton?
  max_player = player_with_longest_name
  most_steals = nil
  most_steals_player = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if most_steals == nil || player_stats[:steals] >= most_steals
        most_steals = player_stats[:steals]
        most_steals_player = player_name
      end
    end
  end
  if max_player == most_steals_player
    true
  else
    false
  end
end
