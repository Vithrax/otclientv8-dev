--- @meta

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--- CUSTOM TYPES
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

--- @class Position
--- @field x number
--- @field y number
--- @field z? number

--- @class Size
--- @field width number
--- @field height number

--- @class Rect
--- @field x number
--- @field y number
--- @field width number
--- @field height number

--- @class Color
--- @field r number
--- @field g number
--- @field b number
--- @field a? number

--- @class Point
--- @field x number
--- @field y number

---@alias AnchorEdge 0 | 1 | 2 | 3 | 4

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--- GLOBAL FUNCTIONS AND VARIABLES
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

_G = {
    allowedLocales = {}
}
modules = {}

LocalPlayer = g_game.getLocalPlayer()

---@version 5.1
bit32 = {
    ---
    ---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-bit32.arshift"])
    ---
    ---@param x integer
    ---@param disp integer
    ---@return integer
    arshift = function(x, disp) end,

    ---
    ---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-bit32.band"])
    ---
    ---@param x integer
    ---@param y integer
    ---@return integer
    band = function(x, y) end,
}

---@version 5.1
bit = {
    ---
    ---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-bit.tobit"])
    ---
    ---@param x integer
    ---@return integer
    tohex = function(x) end,

    ---
    ---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-bit.bnot"])
    ---
    ---@param x integer
    ---@return integer
    bnot = function(x) end,

    ---
    ---[View documents](command:extension.lua.doc?["en-us/54/manual.html/pdf-bit.bor"])
    ---
    ---@param x integer
    ---@param y integer
    ---@return integer
    bor = function(x, y) end,
}

os = {
    --- Returns the current date in the given format.
    --- @param format string
    --- @param time? number
    --- @return string
    date = function(format, time) end
}

--- Returns the outfit color for the given outfit.
--- @param id number
--- @return Color
getOutfitColor = function(id) end

--- Converts an IP address to a string
--- @param ip number
--- @return string
iptostring = function(ip) end

--- Executes all files in the given directory as Lua chunks
--- @param path string
--- @return nil
dofiles = function(path) end

--- Returns the Lua total memory heap size in kilobytes
--- @return number
gcinfo = function() end

--- Regex match function
--- @param string string
--- @param pattern string
--- @return table<number, table<number, string>>
regexMatch = function(string, pattern) end

--- Converts a text to a point.
--- @param text string
--- @return Point
topoint = function(text) end

--- Converts a string to a rect.
--- @param text string
--- @return Rect
torect = function(text) end

--- Converts a string to a size.
--- @param text string
--- @return Size
tosize = function(text) end

--- Converts a string to a color.
--- @param text string
--- @return Color
tocolor = function(text) end

--- Converts a point to a string.
--- @param point Point
--- @return string
pointtostring = function(point) end
--- Converts a rect data to a string
--- @param rect Rect
--- @return string
recttostring = function(rect) end

--- Converts a size data to a string
--- @param size Size
--- @return string
sizetostring = function(size) end

--- Converts a color data to a string
--- @param color Color
--- @return string
colortostring = function(color) end


---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--- CLASSES
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

--- @class g_clock
g_clock = {
    --- Returns last cached time milliseconds elapsed since the program started.
    --- less precise than realMillis() but faster.
    --- @return number
    millis = function() end,

    --- Returns current real-time milliseconds elapsed since the program started.
    --- Use when you need very precise time measurements, otherwise use millis() which is faster.
    --- @return number
    realMillis = function() end,

    --- Returns last cached time microseconds elapsed since the program started.
    --- less precise than realMicros() but faster.
    --- @return number
    micros = function() end,

    --- Returns current real-time microseconds elapsed since the program started.
    --- Use when you need very precise time measurements, otherwise use micros() which is faster.
    --- @return number
    realMicros = function() end,

    --- Returns last cached time seconds elapsed since the program started.
    --- @return number
    seconds = function() end,
}

--- @class g_map
g_map = {
    showZone = function() end,

    --- Sets whether animations are forced to be shown.
    --- @param force boolean
    --- @return nil
    setForceShowAnimations = function(force) end,

    --- Removes the color of the thing with the given id.
    --- @param thingId userdata
    --- @return nil
    removeThingColor = function(thingId) end,
    setZoneOpacity = function() end,
    setWidth = function() end,
    onStaticText = function() end,
    loadOtbm = function() end,
    setShowZones = function() end,
    getCreatureById = function() end,
    onAnimatedText = function() end,

    --- Removes all the effects of the tile with the given id.
    --- @param tilePos Position
    --- @return nil
    cleanTile = function(tilePos) end,

    --- Basic check for two positions to see if they are in sight.
    --- @param fromPos Position
    --- @param toPos Position
    --- @return boolean
    checkSightLine = function(fromPos, toPos) end,

    --- Checks if the sight line between the given positions is clear.
    --- @param fromPos Position
    --- @param toPos Position
    --- @return boolean
    isSightClear = function(fromPos, toPos) end,
    createTile = function() end,
    setDescription = function() end,
    colorizeThing = function() end,
    isWalkable = function() end,
    isShowingAnimations = function() end,
    isPatchable = function() end,
    getOrCreateTile = function() end,
    getHouseFile = function() end,
    saveOtcm = function() end,

    --- Returns the map aware range.
    --- @return {width: number, height: number}
    getAwareRange = function() end,
    onMissle = function() end,

    --- Returns the list of all paths.
    --- @param startPos Position
    --- @param maxDist? number
    --- @param params? table
    --- @return table<number, number>
    findEveryPath = function(startPos, maxDist, params) end,
    findItemsById = function() end,
    setShowAnimations = function() end,
    loadOtcm = function() end,
    isForcingAnimations = function() end,
    isCompletelyCovered = function() end,

    --- Returns the list of spectators in range.
    --- @param position Position
    --- @param multifloor? boolean
    --- @return table<Creature>
    getSpectators = function(position, multifloor) end,
    getTiles = function() end,
    setHouseFile = function() end,

    --- Returns the tile at the given position.
    --- @param position Position
    --- @param distance? number
    --- @return Tile
    getTile = function(position, distance) end,
    cleanTexts = function() end,
    showZones = function() end,

    --- Returns the list of spectators in range.
    --- @param centerPos Position
    --- @param multiFloor boolean
    --- @param minXRange number
    --- @param maxXRange number
    --- @param minYRange number
    --- @param maxYRange number
    --- @return table<Creature>
    getSpectatorsInRangeEx = function(centerPos, multiFloor, minXRange, maxXRange, minYRange, maxYRange) end,
    isCovered = function() end,
    setShowZone = function() end,
    getSize = function() end,
    getZoneColor = function() end,
    isLookPossible = function() end,
    findPath = function() end,
    removeThing = function() end,
    setZoneColor = function() end,
    getSpawnFile = function() end,
    getMinimapColor = function() end,
    removeThingByPos = function() end,
    getSpectatorsInRange = function() end,
    setSpawnFile = function() end,
    clean = function() end,
    setCentralPosition = function() end,


    getDescriptions = function() end,
    setHeight = function() end,

    --- Returns the list of spectators in range.
    --- @param position Position
    --- @param pattern string
    --- @param direction number
    --- @return table<Creature>
    getSpectatorsByPattern = function(position, pattern, direction) end,
    getZoneOpacity = function() end,
    getCentralPosition = function() end,
    removeCreatureById = function() end,

    --- Adds the given thing to the map.
    --- @param thing Thing
    --- @param position Position
    --- @param stackPos? number
    --- @return nil
    addThing = function(thing, position, stackPos) end,
    clearDescriptions = function() end,
    saveOtbm = function() end,
    getThing = function() end,
}

--- @class g_resources
g_resources = {
    --- Returns true if the directory exists.
    --- @param path string
    --- @return boolean
    directoryExists = function(path) end,
    resolvePath = function() end,

    --- Returns the list of files in the given directory.
    --- @param path string
    --- @param fullPath? boolean
    --- @param raw? boolean
    --- @return string[]
    listDirectoryFiles = function(path, fullPath, raw) end,

    --- Creates a directory.
    --- @param path string
    --- @return nil
    makeDir = function(path) end,
    deleteCrashLog = function() end,

    --- Returns currently used layout name.
    --- @return string
    getLayout = function() end,

    --- Sets current layout
    --- @param layoutName string
    --- @return nil
    setLayout = function(layoutName) end,
    getBinaryName = function() end,
    getWriteDir = function() end,

    --- Decompresses the given archive.
    --- @param files string
    --- @return table<string, string>
    decompressArchive = function(files) end,
    getWorkDir = function() end,

    --- Create an compressed archive out of the provided table.
    --- @param filesData table<string, string>
    --- @return string
    createArchive = function(filesData) end,
    readCrashLog = function() end,
    isLoadedFromMemory = function() end,

    --- Updates the data files.
    --- @param files table<string, string>
    --- @param reMount? boolean
    --- @return nil
    updateData = function(files, reMount) end,

    --- Writes the given contents to the file with the given path.
    --- @param path string
    --- @param contents string
    --- @return nil
    writeFileContents = function(path, contents) end,
    listUpdateableFiles = function() end,

    --- Returns the checksums of all the files in the data directory.
    --- @return table<string, string>
    filesChecksums = function() end,

    --- Returns the checksum of the current executable.
    --- @return string
    selfChecksum = function() end,

    --- Updates the executable.
    --- @param fileName string
    --- @return nil
    updateExecutable = function(fileName) end,

    --- Deletes the file with the given path.
    --- @param path string
    --- @return nil
    deleteFile = function(path) end,
    isLoadedFromArchive = function() end,
    guessFilePath = function() end,

    --- Returns true if the file exists.
    --- @param path string
    --- @return boolean
    fileExists = function(path) end,

    --- Returns the contents of the file with the given path.
    --- @param path string
    --- @return string
    readFileContents = function(path) end,

    --- Returns true if the file with the given path is of the given type.
    --- @param path string
    --- @param fileType string
    --- @return boolean
    isFileType = function(path, fileType) end,

    --- Returns the checksum of the file with the given path.
    --- @param path string
    --- @return string
    fileChecksum = function(path) end,
}

--- @class g_settings
g_settings = {
    exists = function() end,
    getFileName = function() end,
    save = function() end,
    setValue = function() end,
    getInteger = function() end,

    --- Returns the string value of the setting with the given key in string format or sets and return a default value.
    --- @param key string
    --- @param defaultValue? string
    --- @return string
    getString = function(key, defaultValue) end,

    --- Returns the size of the node with the given key.
    --- @param key string
    --- @return number
    getNodeSize = function(key) end,
    getColor = function() end,

    --- Returns the the value of the setting with the given key in point format or sets and return a default value.
    --- @param key string
    --- @param defaultValue? Point
    --- @return table
    getPoint = function(key, defaultValue) end,

    --- Returns the the value of the setting with the given key in node format or sets and return a default value.
    --- @param key string
    --- @param defaultValue? boolean
    --- @return boolean
    getBoolean = function(key, defaultValue) end,

    --- Sets a value in the settings file.
    --- @param key string
    --- @param value any
    --- @return nil
    set = function(key, value) end,

    --- Returns the value of the settings with the given key or sets and returns a default value.
    --- @param key string
    --- @param defaultValue? any
    --- @return any
    get = function(key, defaultValue) end,

    --- Sets the default value of the setting with the given key.
    --- @param key string
    --- @param value any
    --- @return nil
    setDefault = function(key, value) end,
    getRect = function() end,

    --- Sets the value of the setting with the given key.
    --- @param key string
    --- @param value any
    --- @return nil
    setNode = function(key, value) end,

    --- Returns the the value of the setting with the given key in size format or sets and return a default value.
    --- @param key string
    --- @param defaultValue? {height: number, width: number}
    --- @return {height: number, width: number}
    getSize = function(key, defaultValue) end,

    --- Returns the the value of the setting with the given key in number format or sets and return a default value.
    --- @param key string
    --- @param defaultValue? number
    --- @return number
    getNumber = function(key, defaultValue) end,

    --- Returns the the value of the setting with the given key in node format or sets and return a default value.
    --- @param key string
    --- @param defaultValue? boolean
    --- @return table
    getNode = function(key, defaultValue) end,

    --- Removes the setting with the given key.
    --- @param key string
    --- @return nil
    remove = function(key) end,

    --- Returns the list of settings with the given key.
    --- @param key string
    --- @return table<number, string>
    getList = function(key) end,
    getValue = function() end,

    --- Merges the given node with the current one.
    --- @param key string
    --- @param node any
    --- @return nil
    mergeNode = function(key, node) end,

    --- Sets the list of settings with the given key.
    --- @param key string
    --- @param value table<number, string>
    --- @return nil
    setList = function(key, value) end,
}

--- @class g_window
g_window = {
    getDisplayHeight = function() end,
    getUnmaximizedSize = function() end,
    getPlatformType = function() end,

    --- Sets the title of the window.
    --- @param title string
    --- @return nil
    setTitle = function(title) end,

    --- Sets the minimum size of the window.
    --- @param rect {height: number, width: number}
    --- @return nil
    setMinimumSize = function(rect) end,
    getUnmaximizedPos = function() end,
    setMouseCursor = function() end,

    --- Returns the keyboard modifiers.
    --- @return number
    getKeyboardModifiers = function() end,
    minimize = function() end,

    --- Enables or disables vertical sync.
    --- @param enable boolean
    --- @return nil
    setVerticalSync = function(enable) end,

    --- Returns true if the given key is pressed.
    --- @param key string|number
    --- @return boolean
    isKeyPressed = function(key) end,
    restoreMouseCursor = function() end,
    isMaximized = function() end,
    getHeight = function() end,

    --- Sets the fullscreen state of the window.
    --- @param fullScreen boolean
    --- @return nil
    setFullscreen = function(fullScreen) end,
    showMouse = function() end,
    isVisible = function() end,

    --- Sets the clipboard text.
    --- @param text string|number
    --- @return nil
    setClipboardText = function(text) end,

    --- Resizes the window.
    --- @param rect {height: number, width: number}
    --- @return nil
    resize = function(rect) end,
    poll = function() end,
    flash = function() end,
    hide = function() end,

    --- Shows the text editor.
    --- @param text string
    --- @param description string
    --- @param initialText string
    --- @param flags 1|0
    --- @return nil
    showTextEditor = function(text, description, initialText, flags) end,
    hasFocus = function() end,
    show = function() end,

    --- Returns the position of the mouse.
    --- @return Point
    getMousePosition = function() end,
    isMouseButtonPressed = function() end,
    getDisplayWidth = function() end,
    hideMouse = function() end,

    --- Returns the size of the user's display.
    --- @return {height: number, width: number}
    getDisplaySize = function() end,
    getClipboardText = function() end,

    --- Returns the position of the mouse.
    --- @return Point
    getPosition = function() end,

    --- Moves the window to the given position.
    --- @param point Point
    --- @return nil
    move = function(point) end,
    getWidth = function() end,

    --- sets the icon of the window.
    --- @param filePath string
    --- @return nil
    setIcon = function(filePath) end,

    --- Returns the size of the window.
    --- @return {height: number, width: number}
    getSize = function() end,
    getX = function() end,
    getY = function() end,
    maximize = function() end,
    isFullscreen = function() end,
}

--- @class g_logger
g_logger = {

    --- Logs an info message.
    --- @param message string|osdate
    --- @return nil
    info = function(message) end,

    --- Logs a message.
    --- @param level number
    --- @param message string
    --- @return nil
    log = function(level, message) end,

    --- Logs a fatal message.
    --- @param message string
    --- @return nil
    fatal = function(message) end,

    --- Sets the function to be called when a log message is generated.
    --- @param callback? fun(level: string, message: string, time: number)
    --- @return nil
    setOnLog = function(callback) end,
    fireOldMessages = function() end,

    --- Logs an error message.
    --- @param message string
    --- @return nil
    error = function(message) end,
    debug = function() end,

    --- Logs a warning message.
    --- @param message string
    --- @return nil
    warning = function(message) end,
    setLogFile = function() end,
    getLastLog = function() end,
}

--- @class g_mouse
g_mouse = {

    --- Loads the cursors from the given file name.
    --- @param fileName string
    --- @return nil
    loadCursors = function(fileName) end,
    bindAutoPress = function() end,

    addCursor = function() end,

    --- Returns true if the given key (or any key) is pressed.
    --- @param key? number
    --- @return boolean
    isPressed = function(key) end,
    bindPressMove = function() end,
    bindPress = function() end,
    isCursorChanged = function() end,

    --- Removes the cursor type layer from stack.
    --- @param cursorType string
    --- @return nil
    popCursor = function(cursorType) end,

    --- Adds the cursor type layer to stack.
    --- @param cursorType string
    --- @return nil
    pushCursor = function(cursorType) end,
}

--- @class g_things
g_things = {
    findItemTypesByString = function() end,

    --- Returns the thing type with the given id.
    --- @param id number
    --- @param category number
    --- @return number
    getThingType = function(id, category) end,

    --- Returns true if the DAT file is loaded.
    --- @return boolean
    isDatLoaded = function() end,

    --- Loads the given DAT file.
    --- @param fileName string?
    --- @return boolean
    loadDat = function(fileName) end,
    findItemTypesByName = function() end,

    --- Returns the content revision.
    --- @return number
    getContentRevision = function() end,
    findItemTypeByCategory = function() end,

    --- Returns the DAT signature.
    --- @return number
    getDatSignature = function() end,
    loadOtb = function() end,

    --- Returns the thing type with the given attribute.
    --- @param attr number
    --- @param category number
    --- @return table
    findThingTypeByAttr = function(attr, category) end,
    replaceTextures = function() end,

    --- Returns the list of market categories.
    --- @return number[]
    getMarketCategories = function() end,
    findItemTypeByName = function() end,
    getThingTypes = function() end,
    saveDat = function() end,
    loadOtml = function() end,
    loadXml = function() end,
    isOtbLoaded = function() end,
    findItemTypeByClientId = function() end,
    getItemType = function() end,
    dumpTextures = function() end,
}

--- @class g_sprites
g_sprites = {

    --- Returns sprites signature.
    --- @return number
    getSprSignature = function() end,

    --- Loads the given SPR file.
    --- @param path string?
    --- @return boolean
    loadSpr = function(path) end,
}

--- @class g_game
g_game = {
    --- Returns the local player.
    --- @return Player
    getLocalPlayer = function() end,

    --- Tries to safetly logout the player.
    --- @return nil
    safeLogout = function() end,

    --- Tries to login the player to the given world.
    --- @param account string
    --- @param password string
    --- @param worldName string
    --- @param worldHost string
    --- @param worldPort number
    --- @param characterName string
    --- @param authenticatorToken string
    --- @param sessionKey string
    --- @return nil
    loginWorld = function(account, password, worldName, worldHost, worldPort, characterName, authenticatorToken,
                          sessionKey)
    end,

    --- Terminates the login process.
    --- @return nil
    cancelLogin = function() end,

    --- Returns the client protocol version.
    --- @return ProtocolGame
    getProtocolGame = function() end,

    --- Sends use command to the server.
    --- @param item Item
    --- @return nil
    use = function(item) end,
    getClientProtocolVersion = function() end,

    --- Changes the map aware range.
    --- @param xRange number
    --- @param yRange number
    --- @return nil
    changeMapAwareRange = function(xRange, yRange) end,
    onResourceBalance = {
        function() end,
        function() end,
    },

    --- Attacks the given creature.
    --- @param target Creature|nil
    --- @return nil
    attack = function(target) end,
    ping = function() end,
    onAttackingCreatureChange = {
        function() end,
        function() end,
    },
    canReportBugs = function() end,

    --- Inspects open trade request.
    --- @param counterOffer boolean
    --- @param index number
    --- @return nil
    inspectTrade = function(counterOffer, index) end,
    isFollowing = function() end,

    --- Enables or disables party shared experience.
    --- @param enable boolean
    --- @return nil
    partyShareExperience = function(enable) end,

    --- Returns the protocol version.
    --- @return number
    getProtocolVersion = function() end,

    --- Passes the party leadership to the given player.
    --- @param playerId number
    --- @return nil
    partyPassLeadership = function(playerId) end,
    rejectTrade = function() end,
    isAttacking = function() end,

    --- Returns the client version.
    --- @return number
    getClientVersion = function() end,

    --- Returns true if character is online.
    --- @return boolean
    isOnline = function() end,

    --- Returns true if feature is enabled.
    --- @param featureId number
    --- @return boolean
    getFeature = function(featureId) end,

    --- Enables the feature with the given id.
    --- @param featureId number
    --- @return nil
    enableFeature = function(featureId) end,

    --- Disables the feature with the given id.
    --- @param featureId number
    --- @return nil
    disableFeature = function(featureId) end,

    --- Sets the custom protocol version.
    --- @param version number
    --- @return nil
    setCustomProtocolVersion = function(version) end,

    --- Sets the protocol version.
    --- @param version number
    --- @return nil
    setProtocolVersion = function(version) end,

    --- Sets the client version.
    --- @param version number?
    --- @return nil
    setClientVersion = function(version) end,

    --- Sets the custom os.
    --- @param os number
    --- @return nil
    setCustomOs = function(os) end,

    --- Returns if the client is logging in.
    --- @return boolean
    isLogging = function() end,

    --- Returns the name of the character.
    --- @return string
    getCharacterName = function() end,

    --- Returns the name of the world.
    --- @return string?
    getWorldName = function() end,

    --- Sets The maximum number of pre-walking steps.
    --- @param steps number
    --- @return nil
    setMaxPreWalkingSteps = function(steps) end,

    --- Returns the latency of the game.
    --- @return number
    getPing = function() end,

    --- Returns the number of recived packets.
    --- @return number
    getRecivedPacketsCount = function() end,

    --- Returns the size of the recived packets in bytes.
    --- @return number
    getRecivedPacketsSize = function() end,

    --- Sets the next ping delay in milliseconds.
    --- @param time number
    --- @return nil
    setPingDelay = function(time) end,

    --- Returns the list of vips.
    --- @return table<number, table<number, string|boolean|number>>
    getVips = function() end,

    --- Mounts or dismounts the player.,
    --- @param mount boolean
    --- @return nil
    mount = function(mount) end,

    --- Returns the list of containers.
    --- @return table<Container>
    getContainers = function() end,

    --- Returns the OS number.
    --- @return number
    getOs = function() end,

    --- Returns the custom protocol version.
    --- @return number
    getCustomProtocolVersion = function() end,

    --- Returns the attacking creature.
    --- @return Creature|nil
    getAttackingCreature = function() end,

    --- Turns the player in the given direction.
    --- @param direction number
    --- @return nil
    turn = function(direction) end,

    --- Says the given message.
    --- @param message string
    --- @return nil
    talk = function(message) end,

    --- Equips the given item. Only for protocols 910+
    --- @param item Item
    --- @return nil
    equipItem = function(item) end,

    --- Sends use command to the server by the given item id.
    --- @param id number
    --- @param subType? number
    --- @return nil
    useInventoryItem = function(id, subType) end,

    --- Sends use with command to the server.
    --- @param item Item
    --- @param target Thing
    --- @param subType? number
    --- @return nil
    useWith = function(item, target, subType) end,

    --- Sends use with command to the server by the given item id.
    --- @param id number
    --- @param target Thing
    --- @param subType? number
    --- @return nil
    useInventoryItemWith = function(id, target, subType) end,

    --- Sens look command to the server.
    --- @param thing Thing
    --- @param isBattleList? boolean
    --- @return nil
    look = function(thing, isBattleList) end,

    --- Cancels attack command
    --- @return nil
    cancelAttack = function() end,

    --- Returns the following creature.
    --- @return Creature|nil
    getFollowingCreature = function() end,

    --- Auto walks to the given destination.
    --- @param destination table<number>
    --- @param startPos? Position
    --- @return boolean
    autoWalk = function(destination, startPos) end,

    --- Says the given text in the given channel.
    --- @param mode number
    --- @param channelId number
    --- @param text string
    --- @return nil
    talkChannel = function(mode, channelId, text) end,

    --- Sells the given item.
    --- @param item Item
    --- @param count? number
    --- @param ignoreEquipped? boolean
    --- @return nil
    sellItem = function(item, count, ignoreEquipped) end,

    --- Buys the given item.
    --- @param item Item
    --- @param count? number
    --- @param ignoreCapacity? boolean
    --- @param withBackpack? boolean
    --- @return nil
    buyItem = function(item, count, ignoreCapacity, withBackpack) end,

    --- Forces server to update current player outfit.
    --- @return nil
    requestOutfit = function() end,

    --- Sends a message to the server with updated player outfit.
    --- @param outfit table<string, number>
    --- @return nil
    changeOutfit = function(outfit) end,

    --- Sends a private message to the given receiver.
    --- @param mode number
    --- @param receiver string
    --- @param text string
    --- @return nil
    talkPrivate = function(mode, receiver, text) end,

    --- Returns the Item with the given id.
    --- @param itemId number
    --- @param subType number
    --- @return Item|nil
    findItemInContainers = function(itemId, subType) end,

    --- Sends the follow command on the given creature to the server.
    --- @param creature Creature|nil
    --- @return nil
    follow = function(creature) end,

    --- Sends the cancel follow command to the server.
    --- @return nil
    cancelFollow = function() end,

    --- Sends the stop attack and follow command to the server.
    --- @return nil
    cancelAttackAndFollow = function() end,

    --- Forces the client to logout.
    forceLogout = function() end,

    --- Enables or disables the tile thing lua callbacks. This callback is expensive and should be disabled when not needed. Used by the bot as optimization.
    --- @param enable boolean
    --- @return nil
    enableTileThingLuaCallback = function(enable) end,

    --- Sends a request to the server to send back the list of channels.
    --- @return nil
    requestChannels = function() end,

    --- Opens the given text channel.
    --- @param channelId number
    --- @return nil
    joinChannel = function(channelId) end,

    --- Opens the rule violation report about the given thing.
    --- @param name string
    --- @return nil
    openRuleViolation = function(name) end,

    --- Cancels the rule violation report.
    --- @return nil
    cancelRuleViolation = function(target) end,

    --- Closes the given rule violation channel.
    --- @param channelName number
    --- @return nil
    closeRuleViolation = function(channelName) end,

    --- Notifies the server that the player is leaving the given channel.
    --- @param channelId number
    --- @return nil
    leaveChannel = function(channelId) end,

    --- Notifies the server that the player is leaving the NPC channel.
    --- @return nil
    closeNpcChannel = function() end,

    --- Opens a new private channel with given player.
    --- @param receiver string
    --- @return nil
    openPrivateChannel = function(receiver) end,

    --- Adds a new VIP.
    --- @param name string
    --- @return nil
    addVip = function(name) end,

    --- Opens the own private channel.
    --- @return nil
    openOwnChannel = function() end,

    --- Invites the given player to the own private channel.
    --- @param name string
    --- @return nil
    inviteToOwnChannel = function(name) end,

    --- Excludes the given player from the own private channel.
    --- @param name string
    --- @return nil
    excludeFromOwnChannel = function(name) end,

    --- Moves the given item to the given position.
    --- @param item Item
    --- @param toPos Position
    --- @param count? number
    --- @return nil
    move = function(item, toPos, count) end,

    --- Returns true if player is game master.
    --- @return boolean
    isGM = function() end,

    --- Returns true if the game connection is ok.
    --- @return boolean
    isConnectionOk = function() end,

    --- Sends a trade request to the given creature.
    --- @param item Item
    --- @param creature Creature
    --- @return nil
    requestTrade = function(item, creature) end,

    --- Opens a container.
    --- @param container Container
    --- @param parentContainer? Container
    open = function(container, parentContainer) end,

    --- Rotates the given item.
    --- @param item Item
    --- @return nil
    rotate = function(item) end,

    --- Wraps the given item.
    --- @param item Item
    --- @return nil
    wrap = function(item) end,

    --- Browses the field at the given position.
    --- @param position Position
    --- @return nil
    browseField = function(position) end,

    --- Moves the given item to the parent container.
    --- @param item Item
    --- @param count? number
    --- @return nil
    moveToParentContainer = function(item, count) end,

    --- Leaves the party.
    --- @return nil
    partyLeave = function() end,

    --- Joins the party.
    --- @param playerId number
    --- @return nil
    partyJoin = function(playerId) end,

    --- Invites the given player to the party.
    --- @param playerId number
    --- @return nil
    partyInvite = function(playerId) end,

    --- Revokes the given invitation.
    --- @param playerId number
    --- @return nil
    partyRevokeInvitation = function(playerId) end,

    --- Returns true if the player is dead.
    --- @return boolean
    isDead = function() end,

    --- Sends a stop command to the server.
    --- @return nil
    stop = function() end,

    --- Walks in the given direction.
    --- @param dir number
    --- @param preWalked? boolean
    --- @return boolean
    walk = function(dir, preWalked) end,
}

--- @class g_ui
g_ui = {
    getStyleClass = function() end,

    --- Imports otui data from the given string.
    --- @param otml string
    --- @return nil
    importStyleFromString = function(otml) end,
    isMouseGrabbed = function() end,

    --- Creates a new UI widget out of an OTUI file name.
    --- @param otuiFileName string
    --- @return UIWidget
    displayUI = function(otuiFileName) end,
    isKeyboardGrabbed = function() end,
    getPressedWidget = function() end,

    --- Enables or disables drawing of debug boxes on otui widgets.
    --- @param enable boolean
    --- @return nil
    setDebugBoxesDrawing = function(enable) end,

    --- Creates a new widget.
    --- @param widgetName string
    --- @param parentWidget? UIWidget
    --- @return UIWidget
    createWidget = function(widgetName, parentWidget) end,

    --- Loads the UI from the given string.
    --- @param otml string
    --- @param parentWidget? UIWidget
    --- @return UIWidget
    loadUIFromString = function(otml, parentWidget) end,

    --- Returns true if drawing of debug boxes on otui widgets is enabled.
    --- @return boolean
    isDrawingDebugBoxes = function() end,

    --- Returns the root widget.
    --- @return UIWidget
    getRootWidget = function() end,
    clearStyles = function() end,
    getStyle = function() end,

    --- Imports otui data from the given file name.
    --- @param fileName string
    --- @return nil
    importStyle = function(fileName) end,

    --- Loads the UI from the given file.
    --- @param fileName string
    --- @param parent? UIWidget
    --- @return UIWidget
    loadUI = function(fileName, parent) end,
    getDraggingWidget = function() end,
    createWidgetFromOTML = function() end,
}

--- @class g_modules
g_modules = {
    discoverModules = function() end,

    --- Returns the module with the given name.
    --- @param name string
    --- @return table
    getModule = function(name) end,

    --- Ensures the module with the given name is loaded.
    --- @param moduleName string
    --- @return nil
    ensureModuleLoaded = function(moduleName) end,
    reloadModules = function() end,
    discoverModule = function() end,
    unloadModules = function() end,

    --- Returns the list of loaded modules.
    --- @return table<userdata>
    getModules = function() end,

    --- Auto loads the modules with the given priority.
    --- @param maxPriority number
    --- @return nil
    autoLoadModules = function(maxPriority) end,
}

--- @class g_app
g_app = {
    isStopping = function() end,
    getOs = function() end,

    --- Returns the version of the application.
    --- @return string
    getVersion = function() end,

    --- Returns the revision of the application.
    --- @return number
    getBuildRevision = function() end,
    getBuildType = function() end,
    getBuildCommit = function() end,
    restart = function() end,

    --- Sets the maximum framerate.
    --- @param maxFps number
    --- @return nil
    setMaxFps = function(maxFps) end,
    getGraphicsFps = function() end,

    --- Returns the name of the application.
    --- @return string
    getName = function() end,

    --- Returns the author of the application.
    --- @return string
    getAuthor = function() end,
    getMaxFps = function() end,
    getBuildCompiler = function() end,
    getBuildDate = function() end,
    doMapScreenshot = function() end,
    onExit = {
        function() end,
        function() end,
    },

    -- Resizes every UI widget in the given scale
    --- @param scale number
    --- @return nil
    scale = function(scale) end,
    restartArgs = function() end,
    quick_exit = function() end,

    --- Enables or disables smooth rendering.
    --- @param smooth boolean
    --- @return nil
    setSmooth = function(smooth) end,
    getProcessingFps = function() end,
    scaleDown = function() end,
    getCompactName = function() end,

    --- Returns the startup options.
    --- @return string
    getStartupOptions = function() end,
    onRun = {
        function() end,
        function() end,
    },
    onTerminate = function() end,
    isOnInputEvent = function() end,

    --- Takes a screenshot.
    --- @param fileName string
    --- @return nil
    doScreenshot = function(fileName) end,
    setCompactName = function() end,
    isRunning = function() end,

    --- Sets the name of the application.
    --- @param name string
    --- @return nil
    setName = function(name) end,
    exit = function() end,

    --- Returns true if the application is running on mobile device.
    --- @return boolean
    isMobile = function() end,
    scaleUp = function() end,
    setVersion = function() end,
    getFps = function() end,
    getBuildArch = function() end,
}

--- @class g_configs
g_configs = {
    load = function() end,
    unload = function() end,

    --- Loads the settings from the given file.
    --- @param path string
    --- @return nil
    loadSettings = function(path) end,
    get = function() end,

    --- Creates a new config at the given path.
    --- @param path string
    --- @return Config
    create = function(path) end,

    --- Returns the config.
    --- @return Config
    getSettings = function() end,
}

--- @class g_healthBars
g_healthBars = {
    --- Returns the offset of the mana bar with the given id.
    --- @param id number
    --- @return Point
    getManaBarOffset = function(id) end,

    --- Returns the offset of the mana bar with the given id.
    --- @param id number
    --- @return Point
    getManaBarOffsetBar = function(id) end,

    --- Returns the path of the health bar with the given id.
    --- @param id number
    --- @return string
    getHealthBarPath = function(id) end,

    --- Returns the height of the health bar with the given id.
    --- @param id number
    --- @return number
    getManaBarHeight = function(id) end,

    --- Returns the offset of the health bar with the given id.
    --- @param id number
    --- @return Point
    getHealthBarOffset = function(id) end,

    --- Returns the height of the health bar with the given id.
    --- @param id number
    --- @return number
    getHealthBarHeight = function(id) end,

    --- Adds a health bar background.
    --- @param path string
    --- @param offsetX number
    --- @param offsetY number
    --- @param barOffsetX number
    --- @param barOffsetY number
    --- @param height number
    --- @return nil
    addHealthBackground = function(path, offsetX, offsetY, barOffsetX, barOffsetY, height) end,

    --- Returns the offset of the health bar with the given id.
    --- @param id number
    --- @return Point
    getHealthBarOffsetBar = function(id) end,

    --- Returns the path of the mana bar with the given id.
    --- @param id number
    --- @return string
    getManaBarPath = function(id) end,

    --- Adds a mana bar background.
    --- @param path string
    --- @param offsetX number
    --- @param offsetY number
    --- @param barOffsetX number
    --- @param barOffsetY number
    --- @param height number
    --- @return nil
    addManaBackground = function(path, offsetX, offsetY, barOffsetX, barOffsetY, height) end,
}

--- @class g_sounds
g_sounds = {

    --- Returns the channel with the given id.
    --- @param id number
    --- @return table
    getChannel = function(id) end,

    --- Deavtivates all channels.
    --- @return nil
    stopAll = function() end,

    --- Enables or disables all sounds in game.
    --- @param enable boolean
    --- @return nil
    setAudioEnabled = function(enable) end,
}

--- @class g_textures
g_textures = {
    clearCache = function() end,

    --- Preload and cache the given texture.
    --- @param path string
    --- @return nil
    preload = function(path) end,
}

--- @class g_adaptiveRenderer
g_adaptiveRenderer = {

    --- Sets the level of the adaptive renderer.
    --- @param level number
    --- @return nil
    setLevel = function(level) end,

    --- Returns the level of the adaptive renderer.
    --- @return number
    getLevel = function() end,

    --- Returns the debug info of the adaptive renderer.
    --- @return string
    getDebugInfo = function() end,
}

--- @class g_crypt
g_crypt = {
    --- Generates a UUID
    --- @return number
    genUUID = function() end,

    --- Sets the machine UUID.
    --- @param uuid number
    --- @return boolean
    setMachineUUID = function(uuid) end,

    --- Returns the machine UUID.
    --- @return number
    getMachineUUID = function() end,

    --- Encrypts the given value.
    --- @param value string
    --- @return string
    encrypt = function(value) end,

    --- Decrypts the given value.
    --- @param value string
    --- @return string
    decrypt = function(value) end,

    --- Returns the RSA key size.
    --- @return number
    rsaGetSize = function() end,
}

--- @class g_proxy
g_proxy = {
    --- Adds a proxy to the list.
    --- @param host string
    --- @param port number?
    --- @param priority number?
    --- @return nil
    addProxy = function(host, port, priority) end,

    --- Removes all the proxies from the list.
    --- @return nil
    clear = function() end,

    --- Returns the debug info of the proxies.
    --- @return table
    getProxiesDebugInfo = function() end,

    --- Returns the current ping coming from the proxy.
    --- @return number
    getPing = function() end,
}

--- @class g_graphics
g_graphics = {

    --- Returns the graphics vendor.
    --- @return string
    getVendor = function() end,

    --- Returns the graphics version.
    --- @return string
    getVersion = function() end,

    --- Returns the graphics renderer.
    --- @return string
    getRenderer = function() end,
}

--- @class g_resources
g_platform = {
    --- Returns the CPU name.
    --- @return string
    getCPUName = function() end,

    --- Returns the total system memory.
    --- @return number
    getTotalSystemMemory = function() end,

    --- Returns the system memory.
    --- @return number
    getSystemMemory = function() end,

    --- Returns the OS name.
    --- @return string
    getOSName = function() end,

    --- Returns the memory usage.
    --- @return number
    getMemoryUsage = function() end,

    --- Opens the given URL in the default browser.
    --- @param url string
    --- @return nil
    openUrl = function(url) end,

    --- Opens the given directory in the default file explorer.
    --- @param path string
    --- @return nil
    openDir = function(path) end,
}

--- @class g_atlas
g_atlas = {
    getStats = function() end,
}

--- @class g_extras
g_extras = {

    --- Returns all the extras names.
    --- @return string[]
    getAll = function() end,

    --- Returns the value of the extra with the given name.
    --- @param name string
    --- @return any
    get = function(name) end,

    --- Sets the value of the extra with the given name.
    --- @param name string
    --- @param value any
    --- @return nil
    set = function(name, value) end,

    --- Gets the description of the extra with the given name.
    --- @param extrasName string
    --- @return string
    getDescription = function(extrasName) end,
}

--- @class g_dispatcher
g_dispatcher = {

    --- Adds an event to the event queue.
    --- @param description string
    --- @param callback fun(event: Event)
    --- @param front boolean
    --- @return Event
    addEvent = function(description, callback, front) end,

    --- Schedules an event to be called in the future.
    --- @param description string
    --- @param callback fun(event: Event)
    --- @param delay number
    --- @return Event
    scheduleEvent = function(description, callback, delay) end,

    --- Cycles an event to be called repeatedly.
    --- @param description string
    --- @param callback fun(event: Event)
    --- @param interval number
    --- @return Event
    cycleEvent = function(description, callback, interval) end,
}

--- @class g_stats
g_stats = {
    --- Resets the sleep time.
    --- @return nil
    resetSleepTime = function() end,

    --- Returns the last sleep time.
    --- @return number
    getSleepTime = function() end,

    --- Returns the types amount of the stat.
    --- @return number
    types = function() end,

    --- Returns the value of the stat with the given type.
    --- @param type number
    --- @param limit number
    --- @param pretty boolean
    --- @return number
    get = function(type, limit, pretty) end,

    --- Returns the value of the slow stats with execution time above the given mininmum time.
    --- @param type number
    --- @param limit number
    --- @param pretty boolean
    --- @param minTime number
    --- @return number
    getSlow = function(type, limit, minTime, pretty) end,

    --- Clears given stat info.
    --- @param type number
    --- @return nil
    clear = function(type) end,

    --- Clears given slow stat info.
    --- @param type number
    --- @return nil
    clearSlow = function(type) end,

    --- Returns the widget info.
    --- @param limit number
    --- @param pretty boolean
    --- @return table
    getWidgetsInfo = function(limit, pretty) end,
}

--- @class g_http
g_http = {
    --- Sends a POST request to the given url.
    --- @param url string
    --- @param timeout? number
    --- @param data string
    --- @param isJson? boolean
    --- @return number
    post = function(url, data, timeout, isJson) end,

    --- Sends a GET request to the given url.
    --- @param url string
    --- @param timeout? number
    --- @return string
    get = function(url, timeout) end,

    --- Downloads file from the given url.
    --- @param url string
    --- @param fileName string
    --- @param timeout? number
    --- @return number
    download = function(url, fileName, timeout) end,

    --- Downloads image from the given url.
    --- @param url string
    --- @param fileName string
    --- @param timeout? number
    --- @return number
    downloadImage = function(url, fileName, timeout) end,

    --- Opens a websocket connection to the given url.
    --- @param url string
    --- @param timeout? number
    --- @return number
    ws = function(url, timeout) end,

    --- Sends a websocket message.
    --- @param id number
    --- @param message string
    --- @return nil
    wsSend = function(id, message) end,

    --- Closes the websocket connection.
    --- @param id number
    --- @return nil
    wsClose = function(id) end,

    --- Cancels the http request.
    --- @param id number
    --- @return nil
    cancel = function(id) end,

    --- Sets the user agent. (web browser)
    --- @param userAgent string
    --- @return nil
    setUserAgent = function(userAgent) end,
}

--- @class g_fonts
g_fonts = {
    --- Loads the font from the given file name.
    --- @param fileName string
    --- @return nil
    importFont = function(fileName) end,
}

--- @class g_minimap
g_minimap = {
    clean = function() end,
    --- Loads the minimap from the given file name.
    --- @param fileName string
    --- @return boolean
    loadOtmm = function(fileName) end,

    --- Saves the minimap to the given file name.
    --- @param fileName string
    --- @return nil
    saveOtmm = function(fileName) end,

    --- Loads the minimap image from the given file name.
    --- @param fileName string
    --- @param topLeft? Position
    --- @param colorFactor? number
    --- @return boolean
    loadImage = function(fileName, topLeft, colorFactor) end,

    --- Saves the minimap image to the given file name.
    --- @param fileName string
    --- @param mapRect Rect
    --- @return nil
    saveImage = function(fileName, mapRect) end,
}

--- @class g_shaders
g_shaders = {

    --- Creates a new shader.
    --- @param shaderName string
    --- @param vertex string
    --- @param fragment string
    --- @param colorMatrix? string
    --- @return nil
    createShader = function(shaderName, vertex, fragment, colorMatrix) end,

    --- Creates a new outfit shader.
    --- @param shaderName string
    --- @param vertex string
    --- @param fragment string
    --- @return nil
    createOutfitShader = function(shaderName, vertex, fragment) end,

    --- Adds a texture to the shader.
    --- @param shaderName string
    --- @param fileName string
    --- @return nil
    addTexture = function(shaderName, fileName) end,
}
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--- CUSTOM CLASSES
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

--- @class Event
--- @field _callback fun(event: Event)
Event = {
    --- Cancels the event.
    --- @return nil
    cancel = function(event) end,
}

--- @class Thing
--- @field setId fun(self: Thing, id: number)
--- @field setPosition fun(self: Thing, position: Position)
--- @field getId fun(self: Thing): number
--- @field getPosition fun(self: Thing): Position
--- @field getStackPriority fun(self: Thing): number
--- @field getStackPos fun(self: Thing): number
--- @field getAnimationPhases fun(self: Thing): number
--- @field getTile fun(self: Thing): Tile
--- @field setMarked fun(self: Thing, color: Color)
--- @field isItem fun(self: Thing): boolean
--- @field isMonster fun(self: Thing): boolean
--- @field isNpc fun(self: Thing): boolean
--- @field isCreature fun(self: Thing): boolean
--- @field isEffect fun(self: Thing): boolean
--- @field isMissile fun(self: Thing): boolean
--- @field isPlayer fun(self: Thing): boolean
--- @field isLocalPlayer fun(self: Thing): boolean
--- @field isAnimatedText fun(self: Thing): boolean
--- @field isStaticText fun(self: Thing): boolean
--- @field isGround fun(self: Thing): boolean
--- @field isGroundBorder fun(self: Thing): boolean
--- @field isOnBottom fun(self: Thing): boolean
--- @field isOnTop fun(self: Thing): boolean
--- @field isContainer fun(self: Thing): boolean
--- @field isForceUse fun(self: Thing): boolean
--- @field isMultiUse fun(self: Thing): boolean
--- @field isRotateable fun(self: Thing): boolean
--- @field isNotMoveable fun(self: Thing): boolean
--- @field isPickupable fun(self: Thing): boolean
--- @field isIgnoreLook fun(self: Thing): boolean
--- @field isStackable fun(self: Thing): boolean
--- @field isHookSouth fun(self: Thing): boolean
--- @field isTranslucent fun(self: Thing): boolean
--- @field isFullGround fun(self: Thing): boolean
--- @field isMarketable fun(self: Thing): boolean
--- @field getMarketData fun(self: Thing): table<string, any>
--- @field isUsable fun(self: Thing): boolean
--- @field isWrapable fun(self: Thing): boolean
--- @field isUnwrapable fun(self: Thing): boolean
--- @field isTopEffect fun(self: Thing): boolean
--- @field isLyingCorpse fun(self: Thing): boolean
--- @field getParentContainer fun(self: Thing): Container|nil
--- @field hide fun(self: Thing)
--- @field show fun(self: Thing)
--- @field setHidden fun(self: Thing, hidden: boolean)
--- @field isHidden fun(self: Thing): boolean
ThingType = {}

--- @class Tile
--- @field clean fun(self: Tile)
--- @field addThing fun(self: Tile, thing: Thing, stackPos?: number)
--- @field getThing fun(self: Tile, stackPos: number): Thing
--- @field getThings fun(self: Tile): Thing[]
--- @field getEffect fun(self: Tile, effectId: number): Effect|nil
--- @field getEffects fun(self: Tile): Effect[]
--- @field getItems fun(self: Tile): Item[]
--- @field getThingStackPos fun(self: Tile, thing: Thing): number
--- @field getThingCount fun(self: Tile, thing: Thing): number
--- @field removeThing fun(self: Tile, thing: Thing)
--- @field getTopLookThing fun(self: Tile): Item|nil
--- @field getTopLookThingEx fun(self: Tile, offset: Point): Item|nil
--- @field getTopUseThing fun(self: Tile): Item|nil
--- @field getTopCreature fun(self: Tile): Creature|nil
--- @field getTopCreatureEx fun(self: Tile, offset: Point): Creature|nil
--- @field getTopMoveThing fun(self: Tile): Item|nil
--- @field getTopMultiUseThing fun(self: Tile): Item|nil
--- @field getTopMultiUseThingEx fun(self: Tile, offset: Point): Item|nil
--- @field getPosition fun(self: Tile): Position
--- @field getDrawElevation fun(self: Tile): number
--- @field getCreatures fun(self: Tile): Creature[]
--- @field getGround fun(self: Tile): Tile
--- @field isWalkable fun(self: Tile, ignoreCreatures?: boolean): boolean
--- @field isHouseTile fun(self: Tile): boolean
--- @field isFullGround fun(self: Tile): boolean
--- @field isFullyOpaque fun(self: Tile): boolean
--- @field isLookPossible fun(self: Tile): boolean
--- @field isBlockingProjectile fun(self: Tile): boolean
--- @field hasCreature fun(self: Tile): boolean
--- @field hasBlockingCreature fun(self: Tile): boolean
--- @field isEmpty fun(self: Tile): boolean
--- @field isClickable fun(self: Tile): boolean
--- @field isPathable fun(self: Tile): boolean
--- @field overwriteMinimapColor fun(self: Tile, color: Color)
--- @field select fun(self: Tile)
--- @field unselect fun(self: Tile)
--- @field isSelected fun(self: Tile): boolean
--- @field remFlag fun(self: Tile, flag: number)
--- @field setFlag fun(self: Tile, flag: number)
--- @field setFlags fun(self: Tile, flags: number)
--- @field getFlags fun(self: Tile): number
--- @field hasFlag fun(self: Tile, flag: number): boolean
--- @field getElevation fun(self: Tile): number
--- @field hasElevation fun(self: Tile, elevation: number): boolean
--- @field isBlocking fun(self: Tile): boolean
--- @field canShoot fun(self: Tile, distance: number): boolean
--- @field setWidget fun(self: Tile, widget: UIWidget)
--- @field getWidget fun(self: Tile): UIWidget
--- @field removeWidget fun(self: Tile)
--- @field setText fun(self: Tile, text: string)
--- @field getText fun(self: Tile): string
--- @field setTimer fun(self: Tile, timer: number)
--- @field getTimer fun(self: Tile): number
--- @field setFillColor fun(self: Tile, color: Color)
Tile = {}

--- @class Item : Thing
--- @field create fun(id: number, count?: number): Item
--- @field createOtb fun(id: number, count?: number): Item
--- @field clone fun(self: Item): Item
--- @field getContainerItems fun(self: Item): table<Item>
--- @field getContainerItem fun(self: Item, slot: number): Item
--- @field addContainerItem fun(self: Item, item: Item)
--- @field addContainerItemIndexed fun(self: Item, item: Item, index: number)
--- @field removeContainerItem fun(self: Item, item: Item)
--- @field setCount fun(self: Item, count: number)
--- @field getCount fun(self: Item): number
--- @field getSubType fun(self: Item): number
--- @field getCountOrSubType fun(self: Item): number
--- @field getServerId fun(self: Item): number
--- @field getName fun(self: Item): string
--- @field getDescription fun(self: Item): string
--- @field getText fun(self: Item): string
--- @field setDescription fun(self: Item, description: string)
--- @field setText fun(self: Item, text: string)
--- @field getUniqueId fun(self: Item): number
--- @field getActionId fun(self: Item): number
--- @field setUniqueId fun(self: Item, uniqueId: number)
--- @field setActionId fun(self: Item, actionId: number)
--- @field getTeleportDestination fun(self: Item): Position
--- @field setTeleportDestination fun(self: Item, position: Position)
--- @field isFluidContainer fun(self: Item): boolean
--- @field getClothSlot fun(self: Item): number
--- @field getTooltip fun(self: Item): string
--- @field setTooltip fun(self: Item, tooltip: string)
--- @field getQuickLootFlags fun(self: Item): number
--- @field setQuickLootFlags fun(self: Item, flags: number)
--- @field setShader fun(self: Item, shader: string)
--- @field getShader fun(self: Item): string
--- @field setCustomAttribute fun(self: Item, attribute: string, value: any)
--- @field getCustomAttribute fun(self: Item, attribute: string): any
Item = {}

--- @class Container : Item
--- @field getItem fun(self: Container): Item
--- @field getItems fun(self: Container): table<Item>
--- @field getItemsCount fun(self: Container): number
--- @field getSlotPosition fun(self: Container, slot: number): Position
--- @field getName fun(self: Container): string
--- @field getId fun(self: Container): number
--- @field getCapacity fun(self: Container): number
--- @field getContainerItem fun(self: Container): Item
--- @field hasParent fun(self: Container): boolean
--- @field isClosed fun(self: Container): boolean
--- @field isUlockable fun(self: Container): boolean
--- @field hasPages fun(self: Container): boolean
--- @field getSize fun(self: Container): number
--- @field getFirstIndex fun(self: Container): number
Container = {}

--- @class Creature : Thing
--- @field create fun(id: number, position: Position, direction: number): Creature
--- @field getId fun(self: Creature): number
--- @field getName fun(self: Creature): string
--- @field setName fun(self: Creature, name: string)
--- @field setManaPercent fun(self: Creature, manaPercent: number)
--- @field getManaPercent fun(self: Creature): number
--- @field setHealthPercent fun(self: Creature, healthPercent: number)
--- @field getHealthPercent fun(self: Creature): number
--- @field getSpeed fun(self: Creature): number
--- @field setSpeed fun(self: Creature, speed: number)
--- @field getBaseSpeed fun(self: Creature): number
--- @field setBaseSpeed fun(self: Creature, baseSpeed: number)
--- @field getSkull fun(self: Creature): number
--- @field setSkull fun(self: Creature, skull: number)
--- @field getShield fun(): number
--- @field setShield fun(self: Creature, shield: number)
--- @field getType fun(self: Creature): 0|1|2|3 @ 0 - player, 1 - monster, 2 - npc, 3 - own summon, 4 - other summon
--- @field getIcon fun(self: Creature): number
--- @field setOutfit fun(self: Creature, outfit: table<string, number>)
--- @field getOutfit fun(self: Creature): table<string, number>
--- @field setOutfitColor fun(self: Creature, outfitColor: Color)
--- @field getDirection fun(self: Creature): number
--- @field getWalkDirection fun(self: Creature): number
--- @field getStepDuration fun(self: Creature): number
--- @field getStepProgress fun(self: Creature): number
--- @field getWalkTicksElapsed fun(self: Creature): number
--- @field getStepTicksLeft fun(self: Creature): number
--- @field setDirection fun(self: Creature, direction: number)
--- @field setSkullTexture fun(self: Creature, path: string)
--- @field setShieldTexture fun(self: Creature, path: string, blink: boolean)
--- @field setEmblemTexture fun(self: Creature, path: string)
--- @field setTypeTexture fun(self: Creature, path: string)
--- @field setIconTexture fun(self: Creature, path: string)
--- @field showStaticSquare fun(self: Creature, color: string)
--- @field hideStaticSquare fun(self: Creature)
--- @field isWalking fun(self: Creature): boolean
--- @field isInvisible fun(self: Creature): boolean
--- @field isDead fun(self: Creature): boolean
--- @field isRemoved fun(self: Creature): boolean
--- @field canBeSeen fun(self: Creature): boolean
--- @field canShoot fun(self: Creature, distance: number): boolean
--- @field jump fun(self: Creature, height: number, duration: number)
--- @field getPrewalkingPosition fun(self: Creature, ignoreWalk: boolean): Position
--- @field setInformationColor fun(self: Creature, color: Color)
--- @field resetInformationColor fun(self: Creature)
--- @field setInformationOffset fun(self: Creature, offset: Point)
--- @field getInformationOffset fun(self: Creature): Point
--- @field setText fun(self: Creature, text: string)
--- @field getText fun(self: Creature): string
--- @field clearText fun(self: Creature)
--- @field setTitle fun(self: Creature, title: string)
--- @field getTitle fun(self: Creature): string
--- @field isTimedSquareVisible fun(self: Creature): boolean
--- @field getTimedSquareColor fun(self: Creature): Color
--- @field isStaticSquareVisible fun(self: Creature): boolean
--- @field getStaticSquareColor fun(self: Creature): Color
--- @field addTopWidget fun(self: Creature, widget: UIWidget)
--- @field addBottomWidget fun(self: Creature, widget: UIWidget)
--- @field addDirecionalWidget fun(self: Creature, widget: UIWidget)
--- @field removeTopWidget fun(self: Creature, widget: UIWidget)
--- @field removeBottomWidget fun(self: Creature, widget: UIWidget)
--- @field removeDirecionalWidget fun(self: Creature, widget: UIWidget)
--- @field getTopWidgets fun(self: Creature): table<UIWidget>
--- @field getBottomWidgets fun(self: Creature): table<UIWidget>
--- @field getDirecionalWidgets fun(self: Creature): table<UIWidget>
--- @field clearWidgets fun(self: Creature)
--- @field clearTopWidgets fun(self: Creature)
--- @field clearBottomWidgets fun(self: Creature)
--- @field clearDirecionalWidgets fun(self: Creature)
--- @field setProgressBar fun(self: Creature, duration: number, reverse: boolean)
--- @field getProgressBarPercentage fun(self: Creature): number
Creature = {}

--- @class Monster : Creature
Monster = {}

--- @class Player : Creature
--- @field unlockWalk fun(self: Player)
--- @field lockWalk fun(self: Player, time: number)
--- @field isWalkLocked fun(self: Player): boolean
--- @field canWalk fun(self: Player, dir: number): boolean
--- @field setStates fun(self: Player, states: number)
--- @field setSkill fun(self: Player, skill: number, level: number)
--- @field setBaseSkill fun(self: Player, skill: number, level: number)
--- @field setHealth fun(self: Player, health: number)
--- @field setTotalCapacity fun(self: Player, capacity: number)
--- @field setFreeCapacity fun(self: Player, capacity: number)
--- @field setExperience fun(self: Player, experience: number)
--- @field setLevel fun(self: Player, level: number)
--- @field setMana fun(self: Player, mana: number)
--- @field setMagicLevel fun(self: Player, level: number)
--- @field setSoul fun(self: Player, soul: number)
--- @field setStamina fun(self: Player, stamina: number)
--- @field setKnown fun(self: Player, known: boolean)
--- @field setInventoryItem fun(self: Player, slot: number, item: Item)
--- @field getName fun(): string
--- @field getStates fun(self: Player): number
--- @field getSkillLevel fun(self: Player, skill: number): number
--- @field getSkillBaseLevel fun(self: Player, skill: number): number
--- @field getSkillLevelPercent fun(self: Player, skill: number): number
--- @field getHealth fun(self: Player): number
--- @field getMaxHealth fun(self: Player): number
--- @field getFreeCapacity fun(self: Player): number
--- @field getExperience fun(self: Player): number
--- @field getLevel fun(self: Player): number
--- @field getLevelPercent fun(self: Player): number
--- @field getMana fun(self: Player): number
--- @field getMaxMana fun(self: Player): number
--- @field getMagicLevel fun(self: Player): number
--- @field getMagicLevelPercent fun(self: Player): number
--- @field getSoul fun(self: Player): number
--- @field getItems fun(self: Player, itemId: number, subType?: number): table<Item>
--- @field getCapacity fun(self: Player): number
--- @field getStamina fun(self: Player): number
--- @field getOfflineTrainingTime fun(self: Player): number
--- @field getRegenerationTime fun(self: Player): number
--- @field getBaseMagicLevel fun(self: Player): number
--- @field getTotalCapacity fun(self: Player): number
--- @field getInventoryItem fun(self: Player, slot: number): Item
--- @field getVocation fun(self: Player): number
--- @field getBlessings fun(self: Player): number
--- @field isPremium fun(self: Player): boolean
--- @field isKnown fun(self: Player): boolean
--- @field isPrewalking fun(self: Player): boolean
--- @field hasSight fun(self: Player): boolean
--- @field isAutoWalking fun(self: Player): boolean
--- @field isServerWalking fun(self: Player): boolean
--- @field stopAutoWalk fun(self: Player)
--- @field autoWalk fun(self: Player, pos: Position)
--- @field preWalk fun(self: Player, dir: number)
--- @field dumpWalkMatrix fun(self: Player): string
--- @field startServerWalking fun(self: Player)
--- @field finishServerWalking fun(self: Player)
--- @field getPrewalkingPosition fun(self: Player, ignoreWalk: boolean): Position
--- @field isMounted fun(self: Player): boolean
Player = {}

--- @class LocalPlayer : Player

--- @class Protocol
Protocol = {}

--- @class ProtocolGame
--- @field isConnecting fun(self: ProtocolGame): boolean
--- @field onOpcode fun(self: ProtocolGame, opcode: number, msg: InputMessage): boolean
--- @field onExtendedOpcode fun(self: ProtocolGame, opcode: number, buffer: string)
--- @field registerOpcode fun(self: ProtocolGame, opcode: number, callback: fun(self: ProtocolGame, msg: InputMessage))
--- @field unregisterOpcode fun(self: ProtocolGame, opcode: number)
--- @field registerExtendedOpcode fun(self: ProtocolGame, opcode: number, callback: fun(self: ProtocolGame, opcode: number, buffer: string))
--- @field unregisterExtendedOpcode fun(self: ProtocolGame, opcode: number)
--- @field registerExtendedJSONOpcode fun(self: ProtocolGame, opcode: number, callback: fun(self: ProtocolGame, opcode: number, jsonData: table))
--- @field unregisterExtendedJSONOpcode fun(self: ProtocolGame, opcode: number)
--- @field sendExtendedJSONOpcode fun(self: ProtocolGame, opcode: number, data: table)
--- @field sendExtendedOpCode fun(self: ProtocolGame, opcode: number, data: string)
ProtocolGame = {}

--- @class Effect : Thing
--- @field create fun(id: number, duration: number): Effect
--- @field setId fun(self: Effect, id: number)
Effect = {}

--- @class Missile : Thing
--- @field create fun(id: number, speed: number, damage: number): Missile
--- @field setId fun(self: Missile, id: number)
--- @field getId fun(self: Missile): number
--- @field getSource fun(self: Missile): Position
--- @field getDestination fun(self: Missile): Position
--- @field setPath fun(self: Missile, path: table<number>)
Missile = {}

--- @class InputMessage
InputMessage = {

    --- Returns U8 value from the message.
    --- @return number
    getU8 = function() end,

    --- Returns U16 value from the message.
    --- @return number
    getU16 = function() end,

    --- Returns U32 value from the message.
    --- @return number
    getU32 = function() end,

    --- Returns U64 value from the message.
    --- @return number
    getU64 = function() end,

    --- Returns string value from the message.
    --- @return string
    getString = function() end,

    --- Returns table value from the message.
    --- @return table
    getTable = function() end,

    --- Returns boolean value from the message.
    --- @return boolean
    getBoolean = function() end,
}

--- @class OutputMessage
OutputMessage = {

    --- Creates a new OutputMessage.
    --- @return OutputMessage
    create = function() end,

    --- Adds a U8 value to the message.
    --- @param message OutputMessage
    --- @param value number
    --- @return nil
    addU8 = function(message, value) end,

    --- Adds a U16 value to the message.
    --- @param message OutputMessage
    --- @param value number?
    --- @return nil
    addU16 = function(message, value) end,

    --- Adds a U32 value to the message.
    --- @param message OutputMessage
    --- @param value number?
    --- @return nil
    addU32 = function(message, value) end,

    --- Returns the message size.
    --- @return number
    getMessageSize = function() end,

    --- Adds a string to the message.
    --- @param message OutputMessage
    --- @param value string
    --- @return nil
    addString = function(message, value) end,

    --- Adds a table to the message.
    --- @param message OutputMessage
    --- @param value table
    --- @return nil
    addTable = function(message, value) end,

    --- Adds a boolean value to the message.
    --- @param message OutputMessage
    --- @param value boolean
    --- @return nil
    addBool = function(message, value) end,

    --- Adds a rect value to the message.
    --- @param message OutputMessage
    --- @param value Rect
    --- @return nil
    addRect = function(message, value) end,

    --- Adds a size value to the message.
    --- @param message OutputMessage
    --- @param value Size
    --- @return nil
    addSize = function(message, value) end,

    --- Encrypts the RSA key contained in the message.
    --- @return nil
    encryptRsa = function() end,
}


--- @class Config : string
Config = {
    --- Sets the value of the setting with the given key.
    --- @param self Config
    --- @param key string
    --- @param value any
    --- @return nil
    setValue = function(self, key, value) end,

    --- Returns true if the setting with the given key exists.
    --- @param key string
    --- @return boolean
    exists = function(config, key) end,

    --- Returns the value of the setting with the given key.
    --- @param key string
    --- @return any
    getValue = function(config, key) end,
}

--- @class StaticText : Thing
--- @field create fun(): StaticText
--- @field addMessage fun(self: StaticText, name: string, mode: number, message: string)
--- @field addColoredMessage fun(self: StaticText, name: string, mode: number, highlighData: table)
--- @field setText fun(self: StaticText, text: string)
--- @field setColor fun(self: StaticText, color: Color)
--- @field getColor fun(self: StaticText): Color
--- @field getText fun(self: StaticText): string
StaticText = {}

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--- UI CLASSES
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

--- @class UIWidget
--- @field create fun(): UIWidget
--- @field addChild fun(self: UIWidget, child: UIWidget)
--- @field insertChild fun(self: UIWidget, child: UIWidget, index: number)
--- @field removeChild fun(self: UIWidget, child: UIWidget)
--- @field focusChild fun(self: UIWidget, child: UIWidget, reason: number)
--- @field focusNextChild fun(self: UIWidget, reason: number)
--- @field focusPreviousChild fun(self: UIWidget, reason: number)
--- @field lowerChild fun(self: UIWidget, child: UIWidget)
--- @field raiseChild fun(self: UIWidget, child: UIWidget)
--- @field moveChildToIndex fun(self: UIWidget, child: UIWidget, index: number)
--- @field reorderChildren fun(self: UIWidget)
--- @field lockChild fun(self: UIWidget, child: UIWidget)
--- @field unlockChild fun(self: UIWidget, child: UIWidget)
--- @field mergeStyle fun(self: UIWidget, style: table)
--- @field applyStyle fun(self: UIWidget, styleName: string)
--- @field addAnchor fun(self: UIWidget, edge: AnchorEdge, hookedWidgetId: string, hookedEdge: AnchorEdge)
--- @field removeAnchor fun(self: UIWidget, edge: AnchorEdge)
--- @field fill fun(self: UIWidget, color: Color)
--- @field centerIn fun(self: UIWidget, parent: UIWidget)
--- @field breakAnchors fun(self: UIWidget)
--- @field updateParentLayout fun(self: UIWidget)
--- @field updateLayout fun(self: UIWidget)
--- @field lock fun(self: UIWidget)
--- @field unlock fun(self: UIWidget)
--- @field focus fun(self: UIWidget)
--- @field lower fun(self: UIWidget)
--- @field raise fun(self: UIWidget)
--- @field grabMouse fun(self: UIWidget)
--- @field ungrabMouse fun(self: UIWidget)
--- @field grabKeyboard fun(self: UIWidget)
--- @field ungrabKeyboard fun(self: UIWidget)
--- @field bindRectToParent fun(self: UIWidget, rect: Rect)
--- @field destroy fun(self: UIWidget)
--- @field destroyChildren fun(self: UIWidget)
--- @field setId fun(self: UIWidget, id: string|number)
--- @field setParent fun(self: UIWidget, parent: UIWidget)
--- @field setLayout fun(self: UIWidget, layout: UILayout)
--- @field setRect fun(self: UIWidget, rect: Rect)
--- @field setStyle fun(self: UIWidget, style: table)
--- @field setStyleFromNode fun(self: UIWidget, styleNode: table)
--- @field setEnabled fun(self: UIWidget, enabled: boolean)
--- @field setVisible fun(self: UIWidget, visible: boolean)
--- @field setOn fun(self: UIWidget, on: boolean)
--- @field setChecked fun(self: UIWidget, checked: boolean)
--- @field setFocusable fun(self: UIWidget, focusable: boolean)
--- @field setPhantom fun(self: UIWidget, phantom: boolean)
--- @field setDraggable fun(self: UIWidget, draggable: boolean)
--- @field setFixedSize fun(self: UIWidget, fixedSize: boolean)
--- @field setClipping fun(self: UIWidget, clipping: boolean)
--- @field setLastFocusReason fun(self: UIWidget, reason: number)
--- @field setAutoFocusPolicy fun(self: UIWidget, policy: number)
--- @field setAutoRepeatDelay fun(self: UIWidget, delay: number)
--- @field setVirtualOffset fun(self: UIWidget, offset: Point)
--- @field isVisible fun(self: UIWidget): boolean
--- @field isChildLocked fun(self: UIWidget, child: UIWidget): boolean
--- @field hasChild fun(self: UIWidget, child: UIWidget): boolean
--- @field getChildIndex fun(self: UIWidget, child: UIWidget): number
--- @field getMarginRect fun(self: UIWidget): Rect
--- @field getPaddingRect fun(self: UIWidget): Rect
--- @field getChildrenRect fun(self: UIWidget): Rect
--- @field getAnchoredLayout fun(self: UIWidget): UILayout
--- @field getRootParent fun(self: UIWidget): UIWidget
--- @field getChildAfter fun(self: UIWidget, child: UIWidget): UIWidget
--- @field getChildBefore fun(self: UIWidget, child: UIWidget): UIWidget
--- @field getChildById fun(self: UIWidget, id: string): UIWidget
--- @field getChildByPos fun(self: UIWidget, pos: Point, ignoreClipping?: boolean): UIWidget
--- @field getChildByIndex fun(self: UIWidget, index: number): UIWidget
--- @field recursiveGetChildById fun(self: UIWidget, childId: string): UIWidget
--- @field recursiveGetChildByPos fun(self: UIWidget, pos: Point, ignoreClipping?: boolean): UIWidget
--- @field recursiveGetChildren fun(self: UIWidget): table<UIWidget>
--- @field recursiveGetChildrenByPos fun(self: UIWidget, pos: Point, ignoreClipping?: boolean): table<UIWidget>
--- @field recursiveGetChildrenByMarginPos fun(self: UIWidget, pos: Point, ignoreClipping?: boolean): table<UIWidget>
--- @field backwardsGetWidgetById fun(self: UIWidget, id: string): UIWidget
--- @field resize fun(self: UIWidget, width: number, height: number)
--- @field move fun(self: UIWidget, pos: Point)
--- @field hide fun(self: UIWidget)
--- @field show fun(self: UIWidget)
--- @field disable fun(self: UIWidget)
--- @field enable fun(self: UIWidget)
--- @field isActive fun(self: UIWidget): boolean
--- @field isEnabled fun(self: UIWidget): boolean
--- @field isDisabled fun(self: UIWidget): boolean
--- @field isFocused fun(self: UIWidget): boolean
--- @field isHovered fun(self: UIWidget): boolean
--- @field isPressed fun(self: UIWidget): boolean
--- @field isFirst fun(self: UIWidget): boolean
--- @field isMiddle fun(self: UIWidget): boolean
--- @field isLast fun(self: UIWidget): boolean
--- @field isAlternate fun(self: UIWidget): boolean
--- @field isChecked fun(self: UIWidget): boolean
--- @field isOn fun(self: UIWidget): boolean
--- @field isDragging fun(self: UIWidget): boolean
--- @field isHidden fun(self: UIWidget): boolean
--- @field isExplicityEnabled fun(self: UIWidget): boolean
--- @field isExplicityVisible fun(self: UIWidget): boolean
--- @field isAutoDraw fun(self: UIWidget): boolean
--- @field isFocusable fun(self: UIWidget): boolean
--- @field isPhantom fun(self: UIWidget): boolean
--- @field isDraggable fun(self: UIWidget): boolean
--- @field isFixedSize fun(self: UIWidget): boolean
--- @field isClipping fun(self: UIWidget): boolean
--- @field isDestroyed fun(self: UIWidget): boolean
--- @field hasChildren fun(self: UIWidget): boolean
--- @field containsMarginPoint fun(self: UIWidget, pos: Point): boolean
--- @field containsPaddingPoint fun(self: UIWidget, pos: Point): boolean
--- @field containsPoint fun(self: UIWidget, pos: Point): boolean
--- @field getId fun(self: UIWidget): string
--- @field getSource fun(self: UIWidget): string
--- @field getParent fun(self: UIWidget): UIWidget
--- @field getFocusedChild fun(self: UIWidget): UIWidget
--- @field getChildren fun(self: UIWidget): table<UIWidget>
--- @field getFirstChild fun(self: UIWidget): UIWidget
--- @field getLastChild fun(self: UIWidget): UIWidget
--- @field getLayout fun(self: UIWidget): UILayout
--- @field getStyle fun(self: UIWidget): table
--- @field getChildCount fun(self: UIWidget): number
--- @field getLastFocusReason fun(self: UIWidget): number
--- @field getAutoFocusPolicy fun(self: UIWidget): number
--- @field getAutoRepeatDelay fun(self: UIWidget): number
--- @field getVirtualOffset fun(self: UIWidget): Point
--- @field getStyleName fun(self: UIWidget): string
--- @field getLastClickPosition fun(self: UIWidget): Point
--- @field setX fun(self: UIWidget, x: number)
--- @field setY fun(self: UIWidget, y: number)
--- @field setWidth fun(self: UIWidget, width: number)
--- @field setHeight fun(self: UIWidget, height: number)
--- @field setSize fun(self: UIWidget, size: Size)
--- @field setPosition fun(self: UIWidget, pos: Point)
--- @field setColor fun(self: UIWidget, color: Color)
--- @field setBackgroundColor fun(self: UIWidget, color: Color)
--- @field setBackgroundOffsetX fun(self: UIWidget, offset: number)
--- @field setBackgroundOffsetY fun(self: UIWidget, offset: number)
--- @field setBackgroundOffset fun(self: UIWidget, offset: Point)
--- @field setBackgroundWidth fun(self: UIWidget, width: number)
--- @field setBackgroundHeight fun(self: UIWidget, height: number)
--- @field setBackgroundSize fun(self: UIWidget, size: Size)
--- @field setBackgroundRect fun(self: UIWidget, rect: Rect)
--- @field setIcon fun(self: UIWidget, icon: string)
--- @field setIconColor fun(self: UIWidget, color: Color)
--- @field setIconOffsetX fun(self: UIWidget, offset: number)
--- @field setIconOffsetY fun(self: UIWidget, offset: number)
--- @field setIconOffset fun(self: UIWidget, offset: Point)
--- @field setIconWidth fun(self: UIWidget, width: number)
--- @field setIconHeight fun(self: UIWidget, height: number)
--- @field setIconSize fun(self: UIWidget, size: Size)
--- @field setIconRect fun(self: UIWidget, rect: Rect)
--- @field setIconClip fun(self: UIWidget, clip: Rect)
--- @field setIconAlign fun(self: UIWidget, align: number)
--- @field setBordereWidth fun(self: UIWidget, width: number)
--- @field setBorderWidthTop fun(self: UIWidget, width: number)
--- @field setBorderWidthBottom fun(self: UIWidget, width: number)
--- @field setBorderWidthLeft fun(self: UIWidget, width: number)
--- @field setBorderWidthRight fun(self: UIWidget, width: number)
--- @field setBorderColor fun(self: UIWidget, color: Color)
--- @field setBorderColorTop fun(self: UIWidget, color: Color)
--- @field setBorderColorBottom fun(self: UIWidget, color: Color)
--- @field setBorderColorLeft fun(self: UIWidget, color: Color)
--- @field setBorderColorRight fun(self: UIWidget, color: Color)
--- @field setMargin fun(self: UIWidget, margin: number)
--- @field setMarginHorizontal fun(self: UIWidget, margin: number)
--- @field setMarginVertical fun(self: UIWidget, margin: number)
--- @field setMarginTop fun(self: UIWidget, margin: number)
--- @field setMarginBottom fun(self: UIWidget, margin: number)
--- @field setMarginLeft fun(self: UIWidget, margin: number)
--- @field setMarginRight fun(self: UIWidget, margin: number)
--- @field setPadding fun(self: UIWidget, padding: number)
--- @field setPaddingHorizontal fun(self: UIWidget, padding: number)
--- @field setPaddingVertical fun(self: UIWidget, padding: number)
--- @field setPaddingTop fun(self: UIWidget, padding: number)
--- @field setPaddingBottom fun(self: UIWidget, padding: number)
--- @field setPaddingLeft fun(self: UIWidget, padding: number)
--- @field setPaddingRight fun(self: UIWidget, padding: number)
--- @field setOpacity fun(self: UIWidget, opacity: number)
--- @field setRotation fun(self: UIWidget, rotation: number)
--- @field getX fun(self: UIWidget): number
--- @field getY fun(self: UIWidget): number
--- @field getPosition fun(self: UIWidget): Point
--- @field getWidth fun(self: UIWidget): number
--- @field getHeight fun(self: UIWidget): number
--- @field getSize fun(self: UIWidget): Size
--- @field getRect fun(self: UIWidget): Rect
--- @field getColor fun(self: UIWidget): Color
--- @field getBackgroundColor fun(self: UIWidget): Color
--- @field getBackgroundOffsetX fun(self: UIWidget): number
--- @field getBackgroundOffsetY fun(self: UIWidget): number
--- @field getBackgroundOffset fun(self: UIWidget): Point
--- @field getBackgroundWidth fun(self: UIWidget): number
--- @field getBackgroundHeight fun(self: UIWidget): number
--- @field getBackgroundSize fun(self: UIWidget): Size
--- @field getBackgroundRect fun(self: UIWidget): Rect
--- @field getIconColor fun(self: UIWidget): Color
--- @field getIconOffsetX fun(self: UIWidget): number
--- @field getIconOffsetY fun(self: UIWidget): number
--- @field getIconOffset fun(self: UIWidget): Point
--- @field getIconWidth fun(self: UIWidget): number
--- @field getIconHeight fun(self: UIWidget): number
--- @field getIconSize fun(self: UIWidget): Size
--- @field getIconRect fun(self: UIWidget): Rect
--- @field getIconClip fun(self: UIWidget): Rect
--- @field getIconAlign fun(self: UIWidget): number
--- @field getIconPath fun(self: UIWidget): string
--- @field getBorderTopColor fun(self: UIWidget): Color
--- @field getBorderBottomColor fun(self: UIWidget): Color
--- @field getBorderLeftColor fun(self: UIWidget): Color
--- @field getBorderRightColor fun(self: UIWidget): Color
--- @field getBorderTopWidth fun(self: UIWidget): number
--- @field getBorderBottomWidth fun(self: UIWidget): number
--- @field getBorderLeftWidth fun(self: UIWidget): number
--- @field getBorderRightWidth fun(self: UIWidget): number
--- @field getMarginTop fun(self: UIWidget): number
--- @field getMarginBottom fun(self: UIWidget): number
--- @field getMarginLeft fun(self: UIWidget): number
--- @field getMarginRight fun(self: UIWidget): number
--- @field getPaddingTop fun(self: UIWidget): number
--- @field getPaddingBottom fun(self: UIWidget): number
--- @field getPaddingLeft fun(self: UIWidget): number
--- @field getPaddingRight fun(self: UIWidget): number
--- @field getOpacity fun(self: UIWidget): number
--- @field getRotation fun(self: UIWidget): number
--- @field setQRCode fun(self: UIWidget, code: string, border: number))
--- @field setImageSource fun(self: UIWidget, source: string)
--- @field setImageSourceBase64 fun(self: UIWidget, source: string)
--- @field setImageClip fun(self: UIWidget, clip: string|Rect)
--- @field setImageOffsetX fun(self: UIWidget, offset: number)
--- @field setImageOffsetY fun(self: UIWidget, offset: number)
--- @field setImageOffset fun(self: UIWidget, offset: Point)
--- @field setImageWidth fun(self: UIWidget, width: number)
--- @field setImageHeight fun(self: UIWidget, height: number)
--- @field setImageSize fun(self: UIWidget, size: Size)
--- @field setImageRect fun(self: UIWidget, rect: Rect)
--- @field setImageColor fun(self: UIWidget, color: Color)
--- @field setImageFixedRatio fun(self: UIWidget, fixedRatio: boolean)
--- @field setImageRepeated fun(self: UIWidget, repeated: boolean)
--- @field setImageSmooth fun(self: UIWidget, smooth: boolean)
--- @field setImageAutoResize fun(self: UIWidget, autoResize: boolean)
--- @field setImageBorderTop fun(self: UIWidget, border: number)
--- @field setImageBorderBottom fun(self: UIWidget, border: number)
--- @field setImageBorderLeft fun(self: UIWidget, border: number)
--- @field setImageBorderRight fun(self: UIWidget, border: number)
--- @field setImageBorder fun(self: UIWidget, border: number)
--- @field getImageClip fun(self: UIWidget): Rect
--- @field getImageOffsetX fun(self: UIWidget): number
--- @field getImageOffsetY fun(self: UIWidget): number
--- @field getImageOffset fun(self: UIWidget): Point
--- @field getImageWidth fun(self: UIWidget): number
--- @field getImageHeight fun(self: UIWidget): number
--- @field getImageSize fun(self: UIWidget): Size
--- @field getImageRect fun(self: UIWidget): Rect
--- @field getImageColor fun(self: UIWidget): Color
--- @field isImageFixedRatio fun(self: UIWidget): boolean
--- @field isImageSmooth fun(self: UIWidget): boolean
--- @field isImageAutoResize fun(self: UIWidget): boolean
--- @field getImageBorderTop fun(self: UIWidget): number
--- @field getImageBorderBottom fun(self: UIWidget): number
--- @field getImageBorderLeft fun(self: UIWidget): number
--- @field getImageBorderRight fun(self: UIWidget): number
--- @field getImageTextureWidth fun(self: UIWidget): number
--- @field getImageTextureHeight fun(self: UIWidget): number
--- @field resizeToTexture fun(self: UIWidget)
--- @field clearText fun(self: UIWidget)
--- @field setText fun(self: UIWidget, text: string)
--- @field setColoredText fun(self: UIWidget, text: string[])
--- @field setTextAlign fun(self: UIWidget, align: number)
--- @field setTextOffset fun(self: UIWidget, offset: Point)
--- @field setTextWrap fun(self: UIWidget, wrap: boolean)
--- @field setTextAutoResize fun(self: UIWidget, autoResize: boolean)
--- @field setTextVerticalAutoResize fun(self: UIWidget, autoResize: boolean)
--- @field setTextHorizontalAutoResize fun(self: UIWidget, autoResize: boolean)
--- @field setFont fun(self: UIWidget, font: string)
--- @field getText fun(self: UIWidget): string
--- @field getDrawText fun(self: UIWidget): boolean
--- @field getTextAlign fun(self: UIWidget): number
--- @field getTextOffset fun(self: UIWidget): Point
--- @field getTextWrap fun(self: UIWidget): boolean
--- @field getFont fun(self: UIWidget): string
--- @field getTextSize fun(self: UIWidget): Size
--- @field getUseCount fun(self: UIWidget): number
--- @field setShadow fun(self: UIWidget, shadow: boolean)
--- @field setCursor fun(self: UIWidget, cursor: string)
--- @field setChangeCursorImage fun(self: UIWidget, cursorImage: string)
--- @field setTooltip fun(self: UIWidget, tooltip?: string)
--- @field getTooltip fun(self: UIWidget): string
--- @field ensureChildVisible fun(self: UIWidget, child: UIWidget, offset?: Point)
--- @field getClassName fun(self: UIWidget): string
--- @ CALLBACKS
--- @field onLayoutUpdate fun(self: UIWidget)
--- @field onFocusChange fun(self: UIWidget, focused?: boolean, reason?: number)
--- @field onChildFocusChange fun(self: UIWidget, focusedChild?: UIWidget, oldFocused?: UIWidget, reason?: number)
--- @field onHoverChange fun(self: UIWidget, hovered?: boolean)
--- @field onVisibilityChange fun(self: UIWidget, visible?: boolean)
--- @field onDragEnter fun(self: UIWidget)
--- @field onDragLeave fun(self: UIWidget, mousePos?: Point)
--- @field onDragMove fun(self: UIWidget, mousePos?: Point, mouseMoved?: Point)
--- @field onDrop fun(self: UIWidget, draggedWidget?: UIWidget, mousePos?: Point)
--- @field onKeyText fun(self: UIWidget, keyText?: string)
--- @field onKeyDown fun(self: UIWidget, keyCode?: number, modifiers?: string)
--- @field onKeyPress fun(self: UIWidget, keyCode?: number, modifiers?: string, autoRepeatTick?: number)
--- @field onKeyUp fun(self: UIWidget, keyCode?: number, modifiers?: string)
--- @field onMousePress fun(self: UIWidget, mousePos?: Point, mouseButton?: number)
--- @field onMouseRelease fun(self: UIWidget, mousePos?: Point, mouseButton?: number)
--- @field onMouseMove fun(self: UIWidget, mousePos?: Point, mouseMoved?: Point)
--- @field onMouseWheel fun(self: UIWidget, mousePos?: Point, mouseWheel?: number): boolean
--- @field onClick fun(self: UIWidget, mousePos?: Point)
--- @field onDoubleClick fun(self: UIWidget, mousePos?: Point)
--- @field onStyleApply fun(self: UIScrollBar, styleName: string, styleNode: table)
--- @field onGeometryChange fun(self: UIWidget, oldRect: Rect, newRect: Rect)
--- @field onScrollChange fun(self: UIWidget, value: Point)
--- @field onCheckChange fun(self: UIWidget, checked: boolean)
--- FIELDS
--- @field id string
--- @field baseHeight number
UIWidget = {}

--- @class UIComboBox : UIWidget
--- @field clearOptions fun(self: UIComboBox)
--- @field clear fun(self: UIComboBox)
--- @field getOptionsCount fun(self: UIComboBox): number
--- @field isOption fun(self: UIComboBox, text: string): boolean
--- @field setOption fun(self: UIComboBox, text: string, dontSignal?: boolean)
--- @field updateCurrentOption fun(self: UIComboBox, newText: string)
--- @field setCurrentOption fun(self: UIComboBox, text: string, dontSignal?: boolean)
--- @field addOption fun(self: UIComboBox, text: string, data: any)
--- @field removeOption fun(self: UIComboBox, text: string)
--- @field onOptionChange fun(self: UIComboBox, text: string, data: any)
--- @field setCurrentOptionByData fun(self: UIComboBox, data: table|string, dontSignal?: boolean)

--- @class UIProgressBar : UIWidget

--- @class UIButton : UIWidget

--- @class UITabBar : UIWidget
--- @field create fun(): UITabBar
--- @field onSetup fun(self: UITabBar)
--- @field setContentWidget fun(self: UITabBar, widget: UIWidget)
--- @field addTab fun(self: UITabBar, text: string, panel: UIWidget, icon: string)
--- @field addButton fun(self: UITabBar, text: string, func: fun(self: UITabBar, tab: UIWidget), icon: string)
--- @field removeTab fun(self: UITabBar, tab: UIWidget)
--- @field getTab fun(self: UITabBar, text: string): UIWidget
--- @field selectTab fun(self: UITabBar, tab: UIWidget)
--- @field selectNextTab fun(self: UITabBar)
--- @field selectPrevTab fun(self: UITabBar)
--- @field getTabPanel fun(self: UITabBar, tab: UIWidget): UIWidget
--- @field getCurrentTabPanel fun(self: UITabBar): UIWidget
--- @field getCurrentTab fun(self: UITabBar): UIWidget
--- @field getTabs fun(self: UITabBar): UIWidget[]
--- @field getTabsPanel fun(self: UITabBar): UIWidget[]
--- @field clearTabs fun(self: UITabBar)

--- @class UICreature : UIWidget
--- @field create fun(): UICreature
--- @field setCreature fun(self: UICreature, creature: Creature)
--- @field setOutfit fun(self: UICreature, outfit: number)
--- @field getCreature fun(self: UICreature): Creature
--- @field getOutfit fun(self: UICreature): number
--- @field isFixedCreatureSize fun(self: UICreature): boolean
--- @field setAutoRotating fun(self: UICreature, autoRotating: boolean)
--- @field setDirection fun(self: UICreature, direction: number)
--- @field getDirection fun(self: UICreature): number
--- @field setScale fun(self: UICreature, scale: number)
--- @field getScale fun(self: UICreature): number
--- @field setAnimate fun(self: UICreature, animate: boolean)
--- @field isAnimating fun(self: UICreature): boolean
--- @field setCenter fun(self: UICreature, centered: boolean)
--- @field setOldScaling fun(self: UICreature, oldScaling: boolean)

--- @class UITextEdit : UIWidget
--- @field setCursorPos fun(self: UIWidget, pos: number)
--- @field setSelection fun(self: UIWidget, start: number, end: number)
--- @field setCursorVisible fun(self: UIWidget, visible: boolean)
--- @field setTextHidden fun(self: UIWidget, hidden: boolean)
--- @field setValidCharacters fun(self: UIWidget, validCharacters: string)
--- @field setShiftNavigation fun(self: UIWidget, enable: boolean)
--- @field setMultiline fun(self: UIWidget, multiline: boolean)
--- @field setMaxLength fun(self: UIWidget, maxLength: number)
--- @field setTextVirtualOffset fun(self: UIWidget, offset: Point)
--- @field setEditable fun(self: UIWidget, editable: boolean)
--- @field setSelectable fun(self: UIWidget, selectable: boolean)
--- @field setSelectionColor fun(self: UIWidget, color: Color)
--- @field setSelectionBackgroundColor fun(self: UIWidget, color: Color)
--- @field setAutoScroll fun(self: UIWidget, autoScroll: boolean)
--- @field setAutoSubmit fun(self: UIWidget, autoSubmit: boolean)
--- @field setPlaceholder fun(self: UIWidget, placeholder: string)
--- @field setPlaceholderColor fun(self: UIWidget, color: Color)
--- @field setPlaceholderAlign fun(self: UIWidget, align: number)
--- @field setPlaceholderFont fun(self: UIWidget, font: string)
--- @field moveCursorHorizontally fun(self: UIWidget, right: boolean)
--- @field moveCursorVertically fun(self: UIWidget, up: boolean)
--- @field appendText fun(self: UIWidget, text: string)
--- @field appendCharacter fun(self: UIWidget, character: string)
--- @field removeCharacter fun(self: UIWidget, right: boolean)
--- @field blinkCursor fun(self: UIWidget)
--- @field del fun(self: UIWidget, right?: boolean)
--- @field paste fun(self: UIWidget, text: string)
--- @field selectAll fun(self: UIWidget)
--- @field clearSelection fun(self: UIWidget)
--- @field wrapText fun(self: UIWidget)
--- @field getDisplayedText fun(self: UIWidget): string
--- @field getSelection fun(self: UIWidget): string
--- @field getTextPos fun(self: UIWidget, pos: Point): number
--- @field getCursorPos fun(self: UIWidget): number
--- @field getTextVirtualOffset fun(self: UIWidget): Point
--- @field getTextVirtualSize fun(self: UIWidget): Size
--- @field getTextTotalSize fun(self: UIWidget): Size
--- @field getMaxLength fun(self: UIWidget): number
--- @field getSelectionStart fun(self: UIWidget): number
--- @field getSelectionEnd fun(self: UIWidget): number
--- @field getSelectionColor fun(self: UIWidget): Color
--- @field getSelectionBackgroundColor fun(self: UIWidget): Color
--- @field hasSelection fun(self: UIWidget): boolean
--- @field isCursorVisible fun(self: UIWidget): boolean
--- @field isTextHidden fun(self: UIWidget): boolean
--- @field isShiftNavigation fun(self: UIWidget): boolean
--- @field isMultiline fun(self: UIWidget): boolean
--- @field isEditable fun(self: UIWidget): boolean
--- @field isSelectable fun(self: UIWidget): boolean
--- @field isAutoScrolling fun(self: UIWidget): boolean
--- @field onTextAreaUpdate fun(self: UIWidget, virtualOffset: Point, virtualSize: Size, totalSize: Size)
--- @field onTextChange fun(self: UISpinBox, text: string, oldText: string)
UITextEdit = {}

--- @class UISpinBox : UITextEdit
--- @field create fun(): UISpinBox
--- @field onSetup fun(self: UISpinBox)
--- @field onValueChange fun(self: UISpinBox, value: number)
--- @field showButtons fun(self: UISpinBox)
--- @field hideButtons fun(self: UISpinBox)
--- @field up fun(self: UISpinBox)
--- @field down fun(self: UISpinBox)
--- @field setValue fun(self: UISpinBox, value: number, dontSignal?: boolean)
--- @field getValue fun(self: UISpinBox): number
--- @field setMinimum fun(self: UISpinBox, minimum: number)
--- @field getMinimum fun(self: UISpinBox): number
--- @field setMaximum fun(self: UISpinBox, maximum: number)
--- @field getMaximum fun(self: UISpinBox): number
--- @field setStep fun(self: UISpinBox, step: number)
--- @field setMouseScroll fun(self: UISpinBox, mouseScroll: boolean)
--- @field getMouseScroll fun(self: UISpinBox): boolean

--- @class UIWindow : UIWidget
--- @field close fun(self: UIWindow)
--- @field open fun(self: UIWindow)
--- @field onEscape fun(self: UIWindow)
--- @field onEnter fun(self: UIWindow)

--- @class UIMiniWindow : UIWindow
--- @field open fun(self: UIMiniWindow, dontSave?: boolean)
--- @field close fun(self: UIMiniWindow, dontSave?: boolean)
--- @field minimize fun(self: UIMiniWindow, dontSave?: boolean)
--- @field maximize fun(self: UIMiniWindow, dontSave?: boolean)
--- @field lock fun(self: UIMiniWindow, dontSave?: boolean)
--- @field unlock fun(self: UIMiniWindow, dontSave?: boolean)
--- @field setup fun(self: UIMiniWindow)
--- @field onHeightChange fun(self: UIMiniWindow, height: number)
--- @field getSettings fun(self: UIMiniWindow, name: string): any
--- @field setSettings fun(self: UIMiniWindow, data: table)
--- @field eraseSettings fun(self: UIMiniWindow, data: table)
--- @field clearSettings fun(self: UIMiniWindow)
--- @field saveParent fun(self: UIMiniWindow, parent: UIWidget)
--- @field saveParentPosition fun(self: UIMiniWindow, parentId: string, position: Point)
--- @field saveParentIndex fun(self: UIMiniWindow, parentId: string, index: number)
--- @field disableResize fun(self: UIMiniWindow)
--- @field enableResize fun(self: UIMiniWindow)
--- @field fitOnParent fun(self: UIMiniWindow)
--- @field setContentHeight fun(self: UIMiniWindow, height: number)
--- @field setContentMinimumHeight fun(self: UIMiniWindow, height: number)
--- @field setContentMaximumHeight fun(self: UIMiniWindow, height: number)
--- @field getMinimumHeight fun(self: UIMiniWindow): number
--- @field getMaximumHeight fun(self: UIMiniWindow): number
--- @field isResizeable fun(self: UIMiniWindow): boolean

--- @class UILayout
--- @field  update fun(self: UILayout)
--- @field  updateLater fun(self: UILayout)
--- @field  applyStyle fun(self: UILayout)
--- @field  addWidget fun(self: UILayout)
--- @field  removeWidget fun(self: UILayout)
--- @field  disableUpdates fun(self: UILayout)
--- @field  enableUpdates fun(self: UILayout)
--- @field  setParent fun(self: UILayout)
--- @field  getParentWidget fun(self: UILayout)
--- @field  isUpdateDisabled fun(self: UILayout)
--- @field  isUpdating fun(self: UILayout)
--- @field  isUIAnchorLayout fun(self: UILayout)
--- @field  isUIBoxLayout fun(self: UILayout)
--- @field  isUIHorizontalLayout fun(self: UILayout)
--- @field  isUIVerticalLayout fun(self: UILayout)
--- @field  isGridLayout fun(self: UILayout)


---@class UIGridLayout : UILayout
---@field create fun(parent: UIWidget): UIGridLayout
---@field setCellSize fun(self: UIGridLayout, width: number, height: number)
---@field setCellWidth fun(self: UIGridLayout, width: number)
---@field setCellHeight fun(self: UIGridLayout, height: number)
---@field setCellSpacing fun(self: UIGridLayout, spacing: number)
---@field setFlow fun(self: UIGridLayout, flow: boolean)
---@field setNumColumns fun(self: UIGridLayout, numColumns: number)
---@field setNumLines fun(self: UIGridLayout, numLines: number)
---@field getNumColumns fun(self: UIGridLayout): number
---@field getNumLines fun(self: UIGridLayout): number
---@field getCellSize fun(self: UIGridLayout): Size
---@field getCellSpacing fun(self: UIGridLayout): number
---@field isUIGridLayout fun(self: UILayout): boolean
UIGridLayout = {}

--- @class UIBoxLayout : UILayout
--- @field setSpacing fun(self: UIBoxLayout, spacing: number)
--- @field setFitChildren fun(self: UIBoxLayout, fitChildren: boolean)

--- @class UIVerticalLayout : UIBoxLayout
--- @field create fun(parent: UIWidget): UIVerticalLayout
--- @field setAlignBottom fun(self: UIVerticalLayout, alignBottom: boolean)
--- @field isAlignBottom fun(self: UIVerticalLayout): boolean
UIVerticalLayout = {}

--- @class UIHorizontalLayout : UIBoxLayout
--- @field create fun(parent: UIWidget): UIHorizontalLayout
--- @field setAlignRight fun(self: UIHorizontalLayout, alignRight: boolean)
UIHorizontalLayout = {}

--- @class UIItem : UIWidget
--- @field create fun(): UIItem
--- @field setItemId fun(self: UIItem, itemId: number)
--- @field setItemCount fun(self: UIItem, count: number)
--- @field setItemSubType fun(self: UIItem, subType: number)
--- @field setItemVisible fun(self: UIItem, visible: boolean)
--- @field setItem fun(self: UIItem, item?: Item)
--- @field setVirtual fun(self: UIItem, virtual: boolean)
--- @field setShowCount fun(self: UIItem, showCount: boolean)
--- @field setItemShader fun(self: UIItem, shader: string)
--- @field clearItem fun(self: UIItem)
--- @field getItemId fun(self: UIItem): number
--- @field getItemCount fun(self: UIItem): number
--- @field getItemSubType fun(self: UIItem): number
--- @field getItemCountOrSubType fun(self: UIItem): number
--- @field getItem fun(self: UIItem): Item
--- @field isVirtual fun(self: UIItem): boolean
--- @field isItemVisible fun(self: UIItem): boolean
UIItem = {}

--- @class UISprite : UIWidget
--- @field create fun(): UISprite
--- @field setSpriteId fun(self: UISprite, spriteId: number)
--- @field clearSprite fun(self: UISprite)
--- @field getSpriteId fun(self: UISprite): number
--- @field getSpriteColor fun(self: UISprite): Color
--- @field hasSprite fun(self: UISprite): boolean
UISprite = {}

--- @class UIMinimap : UIWidget
--- @field create fun(): UIMinimap
--- @field zoomIn fun(self: UIMinimap)
--- @field zoomOut fun(self: UIMinimap)
--- @field setZoom fun(self: UIMinimap, zoom: number)
--- @field setMixZoom fun(self: UIMinimap, mixZoom: boolean) @ Should be minZoom
--- @field setMaxZoomIn fun(self: UIMinimap, maxZoomIn: number)
--- @field setCameraPosition fun(self: UIMinimap, pos: Position)
--- @field floorUp fun(self: UIMinimap, steps: number)
--- @field floorDown fun(self: UIMinimap, steps: number)
--- @field getTilePoint fun(self: UIMinimap, point: Point, screenRect?: Rect, mapCenter?: Position, scale?: number): Point
--- @field getTilePosition fun(self: UIMinimap, point: Point, screenRect?: Rect, mapCenter?: Position, scale?: number): Position
--- @field getTileRect fun(self: UIMinimap, point: Point, screenRect?: Rect, mapCenter?: Position, scale?: number): Rect
--- @field getCameraPosition fun(self: UIMinimap): Position
--- @field getMinZoom fun(self: UIMinimap): number
--- @field getMaxZoom fun(self: UIMinimap): number
--- @field getZoom fun(self: UIMinimap): number
--- @field getScale fun(self: UIMinimap): number
--- @field anchorPosition fun(self: UIMinimap, pos: Position)
--- @field fillPosition fun(self: UIMinimap, pos: Position)
--- @field centerInPosition fun(self: UIMinimap, cross: UIWidget, pos: Position)
--- @field setCrossPosition fun(self: UIMinimap, pos: Position)
--- @field getCrossPosition fun(self: UIMinimap): Position
--- @field setAlternativeWidgetsVisible fun(self: UIMinimap, show: boolean)
--- @field getAlternativeWidgetsVisible fun(self: UIMinimap): boolean
--- @field setFloorVisible fun(self: UIMinimap, show: boolean)
--- @field getFloorVisible fun(self: UIMinimap): boolean
--- @field setFloorHeight fun(self: UIMinimap, height: number)
--- @field getFloorHeight fun(self: UIMinimap): number
--- @field getFlag fun(self: UIMinimap, pos: Position, icon?: number, description?: string): UIMinimapFlag|nil
UIMinimap = {}

--- @class UIMinimapFlag : UIWidget
--- @field setIcon fun(self: UIMinimapFlag, icon: string)
--- @field getIcon fun(self: UIMinimapFlag): number
--- @field setDescription fun(self: UIMinimapFlag, description: string)
--- @field getDescription fun(self: UIMinimapFlag): string

--- @class UIMinimapCross : UIWidget
--- @field setIcon fun(self: UIMinimapCross, icon: string)
--- @field getIcon fun(self: UIMinimapCross): string

--- @class UIMinimapFloor : UIWidget
--- @field setIcon fun(self: UIMinimapFloor, icon: string)
--- @field getIcon fun(self: UIMinimapFloor): string

--- @class UIRadioGroup : UIWidget
--- @field addWidget fun(self: UIRadioGroup, widget: UIWidget)
--- @field removeWidget fun(self: UIRadioGroup, widget: UIWidget)
--- @field selectWidget fun(self: UIRadioGroup, widget?: UIWidget)
--- @field clearSelected fun(self: UIRadioGroup)
--- @field getSelected fun(self: UIRadioGroup): UIWidget

--- @class UIGameMap : UIMap

--- @class UIMap : UIWidget
--- @field create fun(): UIMap
--- @field drawSelf fun(self: UIMap)
--- @field movePixels fun(self: UIMap, x: number, y: number)
--- @field setZoom fun(self: UIMap, zoom: number)
--- @field zoomIn fun(self: UIMap)
--- @field zoomOut fun(self: UIMap)
--- @field followCreature fun(self: UIMap, creature: Creature)
--- @field setCameraPosition fun(self: UIMap, pos: Position)
--- @field setMaxZoomIn fun(self: UIMap, maxZoomIn: number)
--- @field setMaxZoomOut fun(self: UIMap, maxZoomOut: number)
--- @field setMultifloor fun(self: UIMap, multifloor: boolean)
--- @field lockVisibleFloor fun(self: UIMap, floor: number)
--- @field ulockVisibleFloor fun(self: UIMap, floor: number)
--- @field setVisibleDimensions fun(self: UIMap, width: number, height: number)
--- @field setDrawFlags fun(self: UIMap, flags: number)
--- @field setDrawTexts fun(self: UIMap, drawTexts: boolean)
--- @field setDrawNames fun(self: UIMap, drawNames: boolean)
--- @field setDrawHealthBars fun(self: UIMap, drawHealthBars: boolean)
--- @field setDrawHealthBarsOnTop fun(self: UIMap, drawHealthBarsOnTop: boolean)
--- @field setDrawLights fun(self: UIMap, drawLights: boolean)
--- @field setDrawManaBars fun(self: UIMap, drawManaBars: boolean)
--- @field setDrawPlayerBars fun(self: UIMap, drawPlayerBars: boolean)
--- @field setAnimated fun(self: UIMap, animated: boolean)
--- @field setKeepAspectRatio fun(self: UIMap, keepAspectRatio: boolean)
--- @field setMinimumAmbientLight fun(self: UIMap, minimumAmbientLight: number)
--- @field setLimitVisibleRange fun(self: UIMap, limitVisibleRange: boolean)
--- @field setFloorFading fun(self: UIMap, floorFading: boolean)
--- @field setCrosshair fun(self: UIMap, crosshairFile: string)
--- @field setShader fun(self: UIMap, shader: string)
--- @field isMultifloor fun(self: UIMap): boolean
--- @field isDrawingTexts fun(self: UIMap): boolean
--- @field isDrawingNames fun(self: UIMap): boolean
--- @field isDrawingHealthBars fun(self: UIMap): boolean
--- @field isDrawingHealthBarsOnTop fun(self: UIMap): boolean
--- @field isDrawingLights fun(self: UIMap): boolean
--- @field isDrawingManaBars fun(self: UIMap): boolean
--- @field isLimitVisibleRangeEnabled fun(self: UIMap): boolean
--- @field isAnimating fun(self: UIMap): boolean
--- @field isKeepAspectRatioEnabled fun(self: UIMap): boolean
--- @field getVisibleDimensions fun(self: UIMap): {width: number, height: number}
--- @field getFollowingCreature fun(self: UIMap): Creature
--- @field getDrawFlags fun(self: UIMap): number
--- @field getCameraPosition fun(self: UIMap): Position
--- @field getPosition fun(self: UIMap): Position
--- @field getPositionOffset fun(self: UIMap): Point
--- @field getTile fun(self: UIMap, pos: Position): Tile
--- @field getMaxZoomIn fun(self: UIMap): number
--- @field getMaxZoomOut fun(self: UIMap): number
--- @field getZoom fun(self: UIMap): number
--- @field getMinimumAmbientLight fun(self: UIMap): number
--- @field getShader fun(self: UIMap): string
UIMap = {}

--- @class UITable : UIWidget
--- @field create fun(): UITable
--- @field onDestroy fun(self: UITable)
--- @field onSetup fun(self: UITable)
--- @field setColumnWidth fun(self: UITable, width: number[])
--- @field setDefaultColumnWidth fun(self: UITable, width: number)
--- @field hasHeader fun(self: UITable): boolean
--- @field clearData fun(self: UITable)
--- @field setHeader fun(self: UITable, headerWidget: UITableRow)
--- @field addHeader fun(self: UITable, data: table<number, any>)
--- @field removeHeader fun(self: UITable)
--- @field addRow fun(self: UITable, data: table<number, any>, height?: number)
--- @field updateRows fun(self: UITable)
--- @field removeRow fun(self: UITable, row: UITableRow)
--- @field toggleSorting fun(self: UITable, enabled: boolean)
--- @field setSorting fun(self: UITable, colId: number, sortType: number)
--- @field sort fun(self: UITable)
--- @field selectRow fun(self: UITable, selectedRow: UITableRow)
--- @field setTableData fun(self: UITable, tableData: table<number, any>)
--- @field setRowStyle fun(self: UITable, style: string, dontUpdate?: boolean)
--- @field setColumnStyle fun(self: UITable, style: string, dontUpdate?: boolean)
--- @field setHeaderRowStyle fun(self: UITable, style: string)
--- @field setHeaderColumnStyle fun(self: UITable, style: string)

--- @class UITableRow : UIWidget
--- @field updateBackgroundColor fun(self: UITableRow)

--- @class UITableHeaderColumn : UIButton

--- @class UIGraph : UIWidget
--- @field create fun(): UIGraph
--- @field addValue fun(self: UIGraph, value: number)
--- @field clear fun(self: UIGraph)
--- @field setLineWidth fun(self: UIGraph, width: number)
--- @field setCapacity fun(self: UIGraph, capacity: number)
--- @field setTitle fun(self: UIGraph, title: string)
--- @field setShowLabels fun(self: UIGraph, showLabels: boolean)

--- @class UIScrollArea : UIWidget
--- @field create fun(): UIScrollArea
--- @field updateScrollBars fun(self: UIScrollArea)
--- @field setVerticalScrollBar fun(self: UIScrollArea, scrollbar: UIScrollBar)
--- @field setHorizontalScrollBar fun(self: UIScrollArea, scrollbar: UIScrollBar)
--- @field setInverted fun(self: UIScrollArea, inverted: boolean)
--- @field setAlwaysScrollMaximum fun(self: UIScrollArea, value: boolean)
--- @field onScrollWidthChange fun(self: UIScrollArea)
--- @field onScrollHeightChange fun(self: UIScrollArea)

--- @class UIScrollBar : UIWidget
--- @field create fun(): UIScrollBar
--- @field onSetup fun(self: UIScrollBar)
--- @field onDecrement fun(self: UIScrollBar)
--- @field onIncrement fun(self: UIScrollBar)
--- @field decrement fun(self: UIScrollBar, count?: number)
--- @field increment fun(self: UIScrollBar, count?: number)
--- @field setMinimum fun(self: UIScrollBar, minimum: number)
--- @field setMaximum fun(self: UIScrollBar, maximum: number)
--- @field setRange fun(self: UIScrollBar, minimum: number, maximum: number)
--- @field setValue fun(self: UIScrollBar, value: number)
--- @field setMouseScroll fun(self: UIScrollBar, scroll: boolean)
--- @field setStep fun(self: UIScrollBar, step: number)
--- @field setOrientation fun(self: UIScrollBar, orientation: string)
--- @field setText fun(self: UIScrollBar, text: string)
--- @field getMaximum fun(self: UIScrollBar): number
--- @field getMinimum fun(self: UIScrollBar): number
--- @field getValue fun(self: UIScrollBar): number
--- @field getStep fun(self: UIScrollBar): number
--- @field getOrientation fun(self: UIScrollBar): string
--- @field getShowValue fun(self: UIScrollBar): boolean
--- @field getSymbol fun(self: UIScrollBar): string
--- @field getMouseScroll fun(self: UIScrollBar): boolean

---@class UIPopupMenu : UIWidget
---@field create fun(): UIPopupMenu
---@field display fun(self: UIPopupMenu, pos: Point)
---@field addOption fun(self: UIPopupMenu, optionName: string, optionCallback: fun(), shortcut?: string)
---@field addSeparator fun(self: UIPopupMenu)
---@field setGameMenu fun(self: UIPopupMenu, state: boolean)

---@class UIMiniWindowContainer : UIWidget
---@field create fun(): UIMiniWindowContainer
---@field addChild fun(self: UIMiniWindowContainer, child: UIWidget)
---@field removeChild fun(self: UIMiniWindowContainer, child: UIWidget)
---@field order fun(self: UIMiniWindowContainer)
---@field fitAll fun(self: UIMiniWindowContainer, noRemoveChild?: UIWidget)
---@field moveTo fun(self: UIMiniWindowContainer, newPanel: UIMiniWindowContainer)
---@field swapInsert fun(self: UIMiniWindowContainer, widget: UIWidget, index: number)
---@field scheduleInsert fun(self: UIMiniWindowContainer, widget: UIWidget, index: number)
---@field saveChildren fun(self: UIMiniWindowContainer)

---@class UICreatureButton : UIWidget
---@field create fun(): UICreatureButton
---@field setCreature fun(self: UICreatureButton, creature: Creature)
---@field getCreature fun(self: UICreatureButton): Creature
---@field getCreatureId fun(self: UICreatureButton): number
---@field setup fun(self: UICreatureButton, id?: number)
---@field update fun(self: UICreatureButton)
---@field creatureSetup fun(self: UICreatureButton, creature: Creature)
---@field updateSkull fun(self: UICreatureButton)
---@field updateEmblem fun(self: UICreatureButton)
---@field updateLifeBarPercent fun(self: UICreatureButton)

---@class UIPopupScrollMenu : UIWidget
---@field create fun(): UIPopupScrollMenu
---@field addOption fun(self: UIPopupScrollMenu, optionName: string, optionCallback: fun(), shortcut?: string)
---@field addSeparator fun(self: UIPopupScrollMenu)
---@field setScrollbarStep fun(self: UIPopupScrollMenu, step: number)
---@field display fun(self: UIPopupScrollMenu, pos: Point)
