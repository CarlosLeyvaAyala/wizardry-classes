-- Main script for Wizardry Classes mod.
--===================================================
-- This serves as a hub for executing all code, since it seems JContainers can't access
-- other files than init.lua inside a module dir and I don't feel like creating dozens
-- of folders for accessing mod functions.

-- As usual, some hacks and workarounds are expected when programming for Skyrim.
-- In this case, the whole Lua code loads and unloads each time we want to run it
-- and we exchange data with Skyrim using tables, so instead of thinking about
-- classes, inhertitance and such, we think about functions that transform data.

-- ;WARNING: READ THIS
-- Another caveat is that it seems like JC objects can't insert new tables on the
-- fly directly from Lua, so many design choices and workarounds were made in account
-- for this (maybe we need to create a JObject instead of a table?).
-- Fortunately, tables seem to be properly allocating inside Lua structrues themselves.

-- package.path = package.path..";E:/Skyrim SE/MO2/mods/DM-SkyrimSE-Library/SKSE/Plugins/JCData/lua/?/init.lua"
-- package.path = package.path..";E:/Skyrim SE/MO2/mods/JContainers SE/SKSE/Plugins/JCData/lua/?/init.lua"

local l = jrequire 'dmlib'

local wizc = {}

-- ;@ignore: this data is only for testing and developing
local data = {
    addons={}, bhv={}, preset={}, widget={}, state={}
}

-- ;>========================================================
-- ;>===                   INTERFACES                   ===<;
-- ;>========================================================

--- Calculates some value based on current level, using a linear curve.
---@param minVal number
---@param maxVal number
---@param lvl number
---@param maxLvl number or nil
---@param minLvl number or nil
---@return number
function wizc.valByLvl(minVal, maxVal, lvl, maxLvl, minLvl)
    minLvl = minLvl or 1
    maxLvl = maxLvl or 50
    local cLvl = l.forceRange(minLvl, maxLvl)(lvl)
    return l.linCurve({x=minLvl, y=minVal}, {x=maxLvl, y=maxVal})(cLvl)
end

-- ;>========================================================
-- ;>===                TREE GENERATION                 ===<;
-- ;>========================================================

--- See `_treeGen.lua` at:
--- https://github.com/CarlosLeyvaAyala/Sandow-Plus-Plus
function wizc.generateDataTree()
    -- local p = l.pipe(
    --     reportWidget.generateDataTree,
    --     skills.generateDataTree
    -- )
    -- return p(data)
end


-- ;>========================================================
-- ;>===                    TESTING                     ===<;
-- ;>========================================================

local function genPlayerData(data)
    -- local s = data.state
    -- s.WGP = 0
    -- s.hoursSlept = 10
    -- s.hoursInactive = 14
    -- s.hoursAwaken = 20

    return data
end

function wizc.runTest()
    local lvl = 10
    print("jump", wizc.valByLvl(1.5, 4, lvl))
    print("fall", wizc.valByLvl(0.5, 0.9, lvl))
    -- local p = l.pipe(
    --     wizc.generateDataTree,
    --     wizc.installAddons,
    --     genPlayerData,
    --     wizc.getDefaults,
    --     simulateDays
    -- )
    -- data = p(data)
    return data
end


return wizc
