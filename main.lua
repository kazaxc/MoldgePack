--- STEAMODDED HEADER
--- MOD_NAME: Moldge Pack
--- MOD_ID: MoldgePack
--- MOD_AUTHOR: [kazaxc]
--- MOD_DESCRIPTION: The moldge pack for Balatrothon.
--- PREFIX: mldg
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{ -- Combined jokers atlas
    key = 'Jokers', -- atlas key
    path = 'Jokers.png', -- path to the image
    px = 71, -- width of one card
    py = 95 -- height of one card
}

SMODS.Atlas{ -- Nice Joker
    key = 'Joker2', -- atlas key
    path = 'Joker2.png', -- path to the image
    px = 138, -- width of one card
    py = 186 -- height of one card
}

SMODS.Atlas{ -- Enhancement atlas
    key = 'Enhancers', -- atlas key
    path = 'Enhancers.png', -- path to the image
    px = 71, -- width of one card
    py = 95 -- height of one cards
}

SMODS.Atlas{ -- Moldge Card
    key = 'MoldgeMaster', -- atlas key
    path = 'MoldgeMaster.png', -- path to the image
    px = 209, -- width of one card
    py = 281 -- height of one cards
}

SMODS.Atlas{ -- Back of house
    key = 'BackHouse', -- atlas key
    path = 'BackHouse.png', -- path to the image
    px = 140, -- width of one card
    py = 188 -- height of one cards
}

SMODS.Atlas{
    key = 'ExtraShort', -- atlas key
    path = 'ExtraShortJoker.png', -- path to the image
    px = 138, -- width of one card
    py = 138 -- height of one cards
}

SMODS.Atlas{
    key = 'dennis', -- atlas key
    path = 'dennis.png', -- path to the image
    px = 140, -- width of one card
    py = 188 -- height of one cards
}

SMODS.Atlas{
    key = 'Appulrelia', -- atlas key
    path = 'Appulrelia.png', -- path to the image
    px = 140, -- width of one card
    py = 188 -- height of one cards
}

SMODS.Atlas{
    key = 'kiss', -- atlas key
    path = 'kiss.png', -- path to the image
    px = 140, -- width of one card
    py = 188 -- height of one cards
}

SMODS.Atlas{
    key = 'MovieNight', -- atlas key
    path = 'MovieNight.png', -- path to the image
    px = 140, -- width of one card
    py = 188 -- height of one cards
}

SMODS.Atlas{
    key = 'RainJoker', -- atlas key
    path = 'RainJoker.png', -- path to the image
    px = 140, -- width of one card
    py = 188 -- height of one cards
}

SMODS.Atlas{
    key = 'ving', -- atlas key
    path = 'ving.png', -- path to the image
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'ethan', -- atlas key
    path = 'ethan.png', -- path to the image
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'ben', -- atlas key
    path = 'ben.png', -- path to the image
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'eepy', -- atlas key
    path = 'eepy.png', -- path to the image
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'euroTruck', -- atlas key
    path = 'eurotruck.png', -- path to the image
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'badger', -- atlas key
    path = 'Badger.png', -- path to the image
    px = 71,
    py = 95
}

SMODS.Atlas{
    key = 'creation', -- atlas key
    path = 'Creation.png', -- path to the image
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'appulrelia', -- joker key
    loc_txt = { -- local text
        name = 'A is for Apple',
        text = {
            'This card gains {C:chips}+#2#{} Chips',
            'for each scored {C:attention}Ace{}',
            '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)'
        }
    },
    config = { extra = { chips = 0, chip_gain = 5 } },
    rarity = 1,
    atlas = 'Appulrelia',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 6,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain } }
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return {
                chip_mod = card.ability.extra.chips,
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
            }
        end
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
            return {
                message = 'A is for Apple!',
                colour = G.C.CHIPS,
                card = card
            }
        end
    end
}

SMODS.Joker{
    key = 'MovieNight', -- joker key
    loc_txt = { -- local text
        name = 'What Time is Movie Night?',
        text = {
            'Gains {X:mult,C:white} X#2# {} Mult',
            'for each scored {C:attention}7{} and {C:attention}9{}',
            '{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)'
        }
    },
    config = { extra = { Xmult = 1, Xmult_gain = 0.1 } },
    rarity = 1,
    atlas = 'MovieNight',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 8,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, card.ability.extra.Xmult_gain } }
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } }
            }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:get_id() == 7 or context.other_card:get_id() == 9 then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
                return {
                    message = 'What Time?!',
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'berry', -- joker key
    loc_txt = { -- local text
        name = 'Berry Club',
        text = {
            '{C:green}#2# in #3#{} chance this',
            'card provides',
            '{X:mult,C:white} X#1# {} Mult',
        }
    },
    config = { extra = { Xmult = 3, odds = 2 } },
    rarity = 1,
    atlas = 'Jokers',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 5,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    calculate = function (self, card, context)        
        if context.joker_main then
            if pseudorandom('melon_land_chatter') > G.GAME.probabilities.normal / card.ability.extra.odds then
                return { message = 'Gift Subs!' }
            else
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
                    Xmult_mod = card.ability.extra.Xmult
                  }
            end
        end
    end
}

SMODS.Joker{
    key = 'kiss', -- joker key
    loc_txt = { -- local text
        name = 'Pair of Fools',
        text = {
            "Gains {C:mult}+#2#{} Mult",
            "if played hand",
            "contains a {C:attention}Pair{} and {C:mult}Heart{}",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
        }
    },
    config = { extra = { mult = 0, mult_gain = 2 } },
    pos = { x = 0, y = 0 },
    cost = 6,
    rarity = 1,
    atlas = 'kiss',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    allow_duplicates = false,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
            }
        end
        
        if context.before and next(context.poker_hands['Pair']) and not context.blueprint then
            local hearts = 0
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit('Hearts') then hearts = hearts + 1 end
            end

            if hearts > 0 then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = 'MWAH!',
                    colour = G.C.MULT,
                    card = card
                } 
            end
        end
    end
}

SMODS.Joker{
    key = 'niceJoker', -- joker key
    loc_txt = { -- local text
        name = 'Nice Cock',
        text = {
            'Each played {C:attention}King{}',
            'gives {C:chips}+#1#{} Chips when scored'
        }
    },
    config = { extra = { chips = 69 } },
    rarity = 1,
    atlas = 'Joker2',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 5,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = {card.ability.extra.chips} }
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play then
            -- :get_id tests for the rank of the card. Other than 2-10, Jack is 11, Queen is 12, King is 13, and Ace is 14.
            if context.other_card:get_id() == 13 then
              -- Specifically returning to context.other_card is fine with multiple values in a single return value, chips/mult are different from chip_mod and mult_mod, and automatically come with a message which plays in order of return.
              return {
                message = 'Nice Cock!',
                chips = card.ability.extra.chips,
                card = context.other_card
              }
            end
          end
    end
}

SMODS.Joker{
    key = 'BackHouse',
    loc_txt = {
        name = 'Back of House',
        text = {
            "Gains {C:mult}+#2#{} Mult",
            "if played hand",
            "contains a {C:attention}Full House{}",
            "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)"
        }
    },
    config = { extra = { mult = 0, mult_gain = 2} },
    pos = { x = 0, y = 0},
    cost = 8,
    rarity = 1,
    atlas = 'BackHouse',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    allow_duplicates = false,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
            }
        end

        if context.before and next(context.poker_hands['Full House']) and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = 'Banned!',
                colour = G.C.MULT,
                card = card
            }
        end
    end
}

SMODS.Joker{
    key = 'ShortJoker', -- joker key
    loc_txt = { -- local text
        name = 'The Jortster',
        text = {
            'Gains {C:chips}+#2#{} Chips',
            'if played hand has',
            ' exactly {C:attention}2{} cards',
            '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)',
        }
    },
    config = { extra = { chips = 0, chip_gain = 8 } },
    pos = { x = 0, y = 0 },
    cost = 4,
    rarity = 1,
    atlas = 'ExtraShort',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    allow_duplicates = false,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain } }
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return {
                chip_mod = card.ability.extra.chips,
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
            }
        end
        if context.before and #context.full_hand == 2 and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
            return {
                message = 'Jorts!',
                colour = G.C.CHIPS,
                card = card
            }
        end
    end,
    set_ability = function (self, card, initial, delay_sprites)
        if self.discovered or card.bypass_discovery_center then
            card.T.h = card.T.w * 0.5
            --card.children.floating_sprite.T.h = card.children.floating_sprite.T.w
        end
    end,
    set_sprites = function (self, card, front)
        if self.discovered or card.bypass_discovery_center then
            card.children.center.scale.y = card.children.center.scale.x
            --card.children.floating_sprite.scale.y = card.children.floating_sprite.scale.x
        end
    end,
    load = function (self, card, card_table, other_card)
        if self.discovered or card.bypass_discovery_center then
            card.T.h = card.T.w * 0.75
            --card.children.floating_sprite.T.h = card.children.floating_sprite.T.w
        end 
    end
}

SMODS.Joker{
    key = 'EuroTruck', -- joker key
    loc_txt = { -- local text
        name = 'Euro Truck Simulator',
        text = {
            'Adds {C:attention}Double{} the diffenence',
            'in rank between the',
            '{C:attention}Highest{} scoring card',
            'and {C:attention}Lowest{} card',
            'held in hand to Mult'
        }
    },
    config = { extra = { mult = 0 } },
    rarity = 1,
    atlas = 'euroTruck',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 6,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            local lowest = 14
            local highest = 0

            for i = 1, #context.scoring_hand do
                local cardScore = context.scoring_hand[i]:get_id()
                if cardScore > highest then highest = cardScore end
            end

            for i = 1, #G.hand.cards do
                local cardScore = G.hand.cards[i]:get_id()
                if cardScore < lowest then lowest = cardScore end
            end

            card.ability.extra.mult = ((highest - lowest) * 2)

            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
            }
        end
    end
}

SMODS.Joker{
    key = 'moldgeMaster', -- joker key
    loc_txt = { -- local text
        name = 'Master of the Moldge',
        text = {
            'All played cards',
            'become {C:attention}Moldge{} cards',
            'when scored'
        }
    },
    config = { extra = {} },
    rarity = 1,
    atlas = 'MoldgeMaster',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 6,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = {} }
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            for _,v in ipairs(context.scoring_hand) do
                v:set_ability(G.P_CENTERS['m_mldg_moldge'])
            end
            return {
                card = card
            }
        end
    end
}

SMODS.Joker{
    key = 'dennis', -- joker key
    loc_txt = { -- local text
        name = 'Dennis',
        text = {
            'Played {C:attention}Moldge{} cards',
            'give {C:mult}+#1#{} Mult when scored'
        }
    },
    config = { extra = { mult = 8, focus = card } },
    rarity = 1,
    atlas = 'dennis',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 4,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function (self, card, context)
        if context.individual and context.other_card.ability.name == 'm_mldg_moldge' and context.cardarea == G.play then
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                card = card
            }
        end
    end
}

SMODS.Joker{
    key = 'RainJoker', -- joker key
    loc_txt = { -- local text
        name = 'Make it Rain',
        text = {
            'Earn {C:money}$#1#{} for each',
            'played {C:attention}Moldge{} card',
        }
    },
    config = { extra = { money = 5, focus = card } },
    rarity = 1,
    atlas = 'RainJoker',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 10,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    calculate = function (self, card, context)
        if context.individual and context.other_card.ability.name == 'm_mldg_moldge' and context.cardarea == G.play then
            return {
                dollars = card.ability.extra.money,
                card = card
            }
        end
    end
}

SMODS.Joker{
    key = 'vingJoker', -- joker key
    loc_txt = { -- local text
        name = 'Ving Rhames',
        text = {
            'Debuffed at start of blind until',
            '{C:attention}Tom Cruise{} joker is owned',
            'Gains {X:mult,C:white} X Mult {} equal to',
            'heighest scored card divided by 10',
            '{C:inactive}(Currently {X:mult,C:white} X#1# {C:inactive} Mult)'
        }
    },
    config = { extra = { Xmult = 1 } },
    rarity = 3,
    atlas = 'ving',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 10,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.Xmult } }
    end,
    calculate = function (self, card, context)

        if context.setting_blind then
            if next(SMODS.find_card('j_mldg_ethan')) then
                card:set_debuff(false)
            else
                card:set_debuff(true)
            end
        end

        if context.joker_main then
            return {
                Xmult_mod = card.ability.extra.Xmult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.Xmult } }
            }
        end

        if context.before and not context.blueprint then
            local heighest = 0.0
            for i = 1, #context.scoring_hand do
                local cardScore = context.scoring_hand[i]:get_id() / 10
                if cardScore > heighest then heighest = cardScore end
            end
            card.ability.extra.Xmult = card.ability.extra.Xmult + heighest
            return {
                message = 'Ethan???',
                colour = G.C.MULT,
                card = card
            }
        end
    end
}

SMODS.Joker{
    key = 'ethan', -- joker key
    loc_txt = { -- local text
        name = 'Tom Cruise',
        text = {
            'Earn {C:money}$#1#{} at',
            'end of round',
            'Helps his friends :)'
        }
    },
    config = { extra = { money = 10 } },
    rarity = 1,
    atlas = 'ethan',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 12,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = card.ability.extra.money
        if bonus > 0 then return bonus end
    end
}

SMODS.Joker{
    key = 'ben10', -- joker key
    loc_txt = { -- local text
        name = 'Ben 10',
        text = {
            "{X:mult,C:white} X#1# {} Mult",
            "{C:green}#2# in #3#{} chance this",
            "card is destroyed",
            "at end of round"
        }
    },
    config = { extra = { Xmult = 10, odds = 10 } },
    rarity = 3,
    atlas = 'ben',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 10,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
          return {
            message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
            Xmult_mod = card.ability.extra.Xmult
          }
        end

        if context.end_of_round and context.game_over == false and not context.repetition and not context.blueprint then
          if pseudorandom('ben10') < G.GAME.probabilities.normal / card.ability.extra.odds then
            G.E_MANAGER:add_event(Event({
              func = function()
                play_sound('tarot1')
                card.T.r = -0.2
                card:juice_up(0.3, 0.4)
                card.states.drag.is = true
                card.children.center.pinch.x = true
                G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.3,
                  blockable = false,
                  func = function()
                    G.jokers:remove_card(card)
                    card:remove()
                    card = nil
                    return true;
                  end
                }))
                return true
              end
            }))
            return {
              message = 'NO MY MENTAL!'
            }
          else
            return {
              message = 'Its Hero Time!'
            }
          end
        end
    end
}

SMODS.Joker{
    key = 'eepy', -- joker key
    loc_txt = { -- local text
        name = 'Gods Eepiest Solider',
        text = {
            "Creates a {C:purple}Tarot{} card",
            "if played hand",
            "contains a {C:attention}Full House{}",
            "and a {C:attention}Face{} card"
        }
    },
    config = { extra = {} },
    rarity = 1,
    atlas = 'eepy',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 4,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = {} }
    end,
    calculate = function (self, card, context)
        if context.joker_main and context.poker_hands['Full House'] then
            local face = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_face() then face = true end
            end
            if face and not (context.blueprint_card or self).getting_sliced and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                local new_card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'car')
                new_card:add_to_deck()
                G.consumeables:emplace(new_card)
                return {
                    message = 'HONK SHOO!'
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'badgerArtist', -- joker key
    loc_txt = { -- local text
        name = 'The Artist',
        text = {
            '{C:green}#1# in #2#{} chance',
            'scored cards',
            'become {C:attention}Wild{}'
        }
    },
    config = { extra = { odds = 2 } },
    rarity = 1,
    atlas = 'badger',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    allow_duplicates = false,
    pos = { x = 0, y = 0 },
    cost = 5,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            for _,v in ipairs(context.scoring_hand) do
                if pseudorandom('badgerArtist') > G.GAME.probabilities.normal / card.ability.extra.odds then
                    v:set_ability(G.P_CENTERS['m_wild'])
                end
            end
            return {
                card = card
            }
        end
    end
}

SMODS.Consumable{
    key = 'creation', -- consumeable key
    set = 'Tarot', -- consumable set
    loc_txt = { -- local text
        name = 'Creation',
        text = {
            'Convert up to {C:attention}#1#{} selected cards',
            'to {C:attention}Moldge{} cards'
        }
    },
    config = { extra = { cards = 2 } },
    atlas = 'creation',
    pos = { x = 0, y = 0 },
    cost = 3,
    unlocked = true,
    discovered = true,
    loc_vars = function(self,info_queue, center)
        return {vars = {center.ability.extra.cards}}
    end,
    can_use = function(self,card)
        if G and G.hand then
            if #G.hand.highlighted ~= 0 and #G.hand.highlighted <= card.ability.extra.cards then
                return true
            end
        end
        return false
    end,
    use = function(self,card,area,copier)
        for i = 1, #G.hand.highlighted do
            G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_mldg_moldge'])
        end
    end
}

SMODS.Enhancement{
    key = 'moldge', -- enhancement key
    loc_txt = { -- local text
        name = 'Moldge Card',
        text = {
            "It's just kind of moldy"
        }
    },
    config = { money = 1 },
    atlas = 'Enhancers',
    pos = { x = 0, y = 0 },
    weight = 5,
    loc_vars = function(self, info_queue)
        return { vars = { self.config.money } }
    end
}

----------------------------------------------
------------MOD CODE END----------------------
