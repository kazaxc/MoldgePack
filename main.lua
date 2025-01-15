--- STEAMODDED HEADER
--- MOD_NAME: Moldge Pack
--- MOD_ID: MoldgePack
--- MOD_AUTHOR: [kazaxc]
--- MOD_DESCRIPTION: The moldge pack for Balatrothon.
--- PREFIX: mldg
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{
    key = 'Jokers', -- atlas key
    path = 'Jokers.png', -- path to the image
    px = 71, -- width of one card
    py = 95 -- height of one card
}

SMODS.Atlas{
    key = 'Joker2', -- atlas key
    path = 'Joker2.png', -- path to the image
    px = 138, -- width of one card
    py = 186 -- height of one card
}

SMODS.Atlas{
    key = 'Enhancers', -- atlas key
    path = 'Enhancers.png', -- path to the image
    px = 71, -- width of one card
    py = 95 -- height of one cards
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
    pos = { x = 0, y = 0 },
    cost = 8,
    isActive = true,
    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.Xmult, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    calculate = function (self, card, context)        
        if context.joker_main then
            if pseudorandom('melon_land_chatter') < G.GAME.probabilities.normal / card.ability.extra.odds then
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
    pos = { x = 0, y = 0 },
    cost = 8,
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

SMODS.Enhancement{
    key = 'moldge', -- enhancement key
    loc_txt = { -- local text
        name = 'Moldge',
        text = {
            'MMMM The Tasty Moldge'
        }
    },
    config = { extra = { odds = 1 } },
    atlas = 'Enhancers',
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue, card)
        return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,
    calculate = function(self, card, context, effect)
        if context.cardarea == G.play and not context.repetition then
            if pseudorandom('moldge') < G.GAME.probabilities.normal / card.ability.extra.odds then
                return { message = 'Moldge!' }
            end
        end
    end
}

----------------------------------------------
------------MOD CODE END----------------------
