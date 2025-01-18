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
    pos = { x = 0, y = 0 },
    cost = 8,
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
        name = 'What Time is Movie Night',
        text = {
            'This card gains {X:mult,C:white} X#2# {} Mult',
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
        if context.individual and context.cardarea == G.play then
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
    pos = { x = 0, y = 0 },
    cost = 8,
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
    pos = { x = 0, y = 0 },
    cost = 6,
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
    cost = 10,
    rarity = 1,
    atlas = 'BackHouse',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
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
            'This Joker gains {C:chips}+#2#{} Chips',
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
        if context.before and #context.full_hand == 2 then
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
    pos = { x = 0, y = 0 },
    cost = 6,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = {} }
    end,
    calculate = function (self, card, context)
        if context.individual and context.cardarea == G.play then
            for _,v in ipairs(context.scoring_hand) do
                v:set_ability(G.P_CENTERS['m_mldg_moldge'])
            end
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
    config = { extra = { mult = 8 } },
    rarity = 1,
    atlas = 'dennis',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    pos = { x = 0, y = 0 },
    cost = 10,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function (self, card, context)
        if context.individual and context.other_card.ability.name == 'm_mldg_moldge' and context.cardarea == G.play then
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
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
    config = { extra = { money = 5 } },
    rarity = 1,
    atlas = 'RainJoker',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    pos = { x = 0, y = 0 },
    cost = 10,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.money } }
    end,
    calculate = function (self, card, context)
        if context.individual and context.other_card.ability.name == 'm_mldg_moldge' and context.cardarea == G.play then
            return {
                dollars = card.ability.extra.money
            }
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
