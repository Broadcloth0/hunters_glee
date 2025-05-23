
local hasSanic = scripted_ents.GetStored( "npc_sanic" )
local hasObunga = scripted_ents.GetStored( "npc_obunga" )

if not ( hasSanic or hasObunga ) then return end -- you are safe


local set = {
    name = "nextbot_brainrot", -- unique name
    prettyName = "PNG Nextbot Brainrot",
    description = "Sanic, and/or Obunga.\nObjectively shallower gameplay.\nYou happy now?",
    difficultyPerMin = { 100 / 10, 1000 / 10 }, -- difficulty per minute
    waveInterval = { 30, 90 }, -- time between spawn waves
    diffBumpWhenWaveKilled = 50, -- when there's <= 1 hunter left, the difficulty is permanently bumped by this amount
    startingBudget = "default", -- so budget isnt 0
    spawnCountPerDifficulty = { 0.05 },
    startingSpawnCount = { 0, 2 },
    maxSpawnCount = 50, -- hard cap on count
    maxSpawnDist = "default",
    roundEndSound = "default",
    roundStartSound = "default",
    resourcesAdded = {},
    spawns = {},
    chanceToBeVotable = 15,
}

if hasSanic then

    local function randomizeVar()
        local dist = math.random( 2500, 6000 )
        if math.random( 0, 100 ) < 50 then
            dist = dist * math.random( 1, 10 )

        end
        RunConsoleCommand( "npc_sanic_acquire_distance", dist )

    end

    local npc = {
        hardRandomChance = { 15, 75 }, -- chance this is even checked
        name = "brainrot_sanic",
        prettyName = "A Sanic",
        class = "npc_sanic",
        spawnType = "hunter",
        difficultyCost = { 10 },
        countClass = "npc_sanic",
        maxCount = { 50 },
        postSpawnedFuncs = { randomizeVar }, -- this can be nil
    }
    table.insert( set.spawns, npc )
    table.insert( set.resourcesAdded, "174117071" )
    RunConsoleCommand( "npc_sanic_force_download", 0 ) -- nuh uh

end

if hasObunga then
    local function randomizeVar()
        local dist = math.random( 2500, 6000 )
        if math.random( 0, 100 ) < 50 then
            dist = dist * math.random( 1, 10 )

        end
        RunConsoleCommand( "npc_obunga_acquire_distance", dist )

    end
    local npc = {
        hardRandomChance = { 15, 75 }, -- chance this is even checked
        name = "brainrot_obunga",
        prettyName = "An Obunga",
        class = "npc_obunga",
        spawnType = "hunter",
        difficultyCost = { 15 },
        countClass = "npc_obunga",
        maxCount = { 50 },
        postSpawnedFuncs = { randomizeVar }, -- this can be nil
    }
    table.insert( set.spawns, npc )
    table.insert( set.resourcesAdded, "2803406998" )
    RunConsoleCommand( "npc_obunga_force_download", 0 )

end

if #set.spawns <= 0 then return end ---???? might happen

-- put the spawnset IN the global table to be gobbled
table.insert( GLEE_SPAWNSETS, set )
