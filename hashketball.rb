def game_hash
    {
        away: {
            team_name:'Charlotte Hornets',
            colors: ['Purple', 'Turquoise'],
            players: [
                { player_name: 'Jeff Adrien',
                    number: 4,
                    shoe: 18,
                    points: 10,
                    rebounds: 1,
                    assists: 1,
                    steals: 2,
                    blocks: 7,
                    slam_dunks: 2 },
                { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
                { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
                { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
                { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
        ]
    },
        home: {
            team_name: "Brooklyn Nets",
            colors: ["Black", "White"],
            players: [
                { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
                { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
                { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
                { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 12,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
                { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ]
        }
    }
end

def num_points_scored(player_name)
    game_hash.each do |team|
        team[1].each do |key, value|
            if key == :players
                value.each do |player_hash|
                    if player_hash[:player_name] == player_name
                        return player_hash[:points]
                    end
                end
            end
        end
    end
end

def shoe_size(player_name)
    game_hash.each do |team|
        team[1].each do |key, value|
            if key == :players
                value.each do |player_hash|
                    if player_hash[:player_name] == player_name
                        return player_hash[:shoe]
                    end
                end
            end
        end
    end
end

def team_colors(team_name)
    game_hash.each do |team|
        team[1].each do |key, value|
            if team[1][key] == team_name
                return team[1][:colors]
            end
        end
    end
end

def team_names
    game_hash.collect do |team|
      team[1][:team_name]
    end
end

def player_numbers(team_name)
    player_array = nil
    if team_name == "Brooklyn Nets"
        player_array = game_hash[:home][:players]
    else
        player_array = game_hash[:away][:players]
    end
    player_array.collect do |player|
        player[:number]
    end
end

def player_stats(player_name)
    game_hash.each do |team|
        team[1][:players].each do |player|
            if player[:player_name] == player_name
                player.delete(:player_name)
                return player
            end
        end
    end
end  

def big_shoe_rebounds
    max_shoe = nil
    player_hash = nil
    game_hash.each do |team|
        team[1][:players].each do |player|
            if  max_shoe == nil || player[:shoe] > max_shoe
                max_shoe = player[:shoe]
                player_hash = player
            end
        end
    end
    player_hash[:rebounds]
end

# **Bonus Questions:**

# 1. Which player has the most points? 
def most_points_scored
    max_scored = nil
    player_name = nil
    game_hash.each do |team|
        team.each do |element|
            if element.is_a?(Hash)
                element[:players].each do |player|
                    if  max_scored == nil || player[:points] > max_scored
                        max_scored = player[:points]
                        player_name = player[:player_name]
                    end
                end
            end
        end
    end
    player_name
end

# 2. Which team has the most points? 
def winning_team
    home = 0
    away = 0
    game_hash.each do |team|
        if team[0] == :away
            team[1][:players].each do |player|
                away += player[:points]
            end
        else 
            team[1][:players].each do |player|
                home += player[:points]
            end
        end
    end
    home > away ? "Brooklyn Nets" : "Charlotte Hornets"
end

# 3. Which player has the longest name? 
def player_with_longest_name
    name_length = 0
    player_name = nil
    game_hash.each do |team|
        team[1][:players].each do |player|
            if  player[:player_name].length > name_length
                name_length = player[:player_name].length
                player_name = player[:player_name]
            end
        end
    end
    player_name
end

# **Super Bonus:**

# 1. Returns true if the player with the longest name had the most steals. 

def long_name_steals_a_ton?
    longest_name = 0
    long_player_name = nil
    most_steals = 0
    most_steals_name = nil

    game_hash.each do |team|
        team[1][:players].each do |player|
            if  player[:player_name].length > longest_name
                longest_name = player[:player_name].length
                long_player_name = player[:player_name]
            end
            if player[:steals] > most_steals
                most_steals += player[:steals]
                most_steals_name = player[:player_name]
            end
        end
    end
    long_player_name == most_steals_name
end










