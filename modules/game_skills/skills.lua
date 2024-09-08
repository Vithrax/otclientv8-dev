skillsWindow = nil
skillsButton = nil

local PREMIUM_STAMINA_THRESHOLD = 40 * 60 -- 40 hours

local tooltipData = {}

function init()
  connect(LocalPlayer, {
    onExperienceChange = onExperienceChange,
    onLevelChange = onLevelChange,
    onHealthChange = onHealthChange,
    onManaChange = onManaChange,
    onSoulChange = onSoulChange,
    onFreeCapacityChange = onFreeCapacityChange,
    onTotalCapacityChange = onTotalCapacityChange,
    onStaminaChange = onStaminaChange,
    onOfflineTrainingChange = onOfflineTrainingChange,
    onRegenerationChange = onRegenerationChange,
    onSpeedChange = onSpeedChange,
    onBaseSpeedChange = onBaseSpeedChange,
    onMagicLevelChange = onMagicLevelChange,
    onBaseMagicLevelChange = onBaseMagicLevelChange,
    onSkillChange = onSkillChange,
    onBaseSkillChange = onBaseSkillChange,
    onExperienceBonusChange = onExperienceBonusChange,
    onPremiumChange = onPremiumChange,
    onStoreBoostXpGainTime = onStoreBoostXpGainTime
  })
  connect(g_game, {
    onGameStart = refresh,
    onGameEnd = offline
  })

  skillsButton = modules.client_topmenu.addRightGameToggleButton('skillsButton', tr('Skills'),
    '/images/topbuttons/skills', toggle, false, 1)
  skillsButton:setOn(true)
  skillsWindow = g_ui.loadUI('skills', modules.game_interface.getRightPanel())

  refresh()
  skillsWindow:setup()
end

function terminate()
  disconnect(LocalPlayer, {
    onExperienceChange = onExperienceChange,
    onLevelChange = onLevelChange,
    onHealthChange = onHealthChange,
    onManaChange = onManaChange,
    onSoulChange = onSoulChange,
    onFreeCapacityChange = onFreeCapacityChange,
    onTotalCapacityChange = onTotalCapacityChange,
    onStaminaChange = onStaminaChange,
    onOfflineTrainingChange = onOfflineTrainingChange,
    onRegenerationChange = onRegenerationChange,
    onSpeedChange = onSpeedChange,
    onBaseSpeedChange = onBaseSpeedChange,
    onMagicLevelChange = onMagicLevelChange,
    onBaseMagicLevelChange = onBaseMagicLevelChange,
    onSkillChange = onSkillChange,
    onBaseSkillChange = onBaseSkillChange,
    onExperienceBonusChange = onExperienceBonusChange,
    onPremiumChange = onPremiumChange,
    onStoreBoostXpGainTime = onStoreBoostXpGainTime
  })
  disconnect(g_game, {
    onGameStart = refresh,
    onGameEnd = offline
  })

  skillsWindow:destroy()
  skillsButton:destroy()
end

function parseMinutesIntoHoursMinutes(seconds)
  local hours = math.floor(seconds / 60)
  local minutes = seconds % 60

  return hours, minutes
end

function updateXpGainTooltip()
  local player = g_game.getLocalPlayer()
  local widget = skillsWindow:recursiveGetChildById('xpGain')
  if not widget then return end

  if not tooltipData.baseXpGain then return end

  -- get data from local variable
  local baseXpGain = tooltipData.baseXpGain
  local voucherAddend = tooltipData.voucherAddend
  local grindingAddend = tooltipData.grindingAddend
  local storeBoostAddend = tooltipData.storeBoostAddend
  local huntingBoostFactor = tooltipData.huntingBoostFactor
  local premiumStaminaTimeLeft = tooltipData.premiumStaminaTimeLeft
  local storeBoostXpGainTime = tooltipData.storeBoostXpGainTime

  local staminaText = ''
  if premiumStaminaTimeLeft and premiumStaminaTimeLeft > 0 and player:isPremium() then
    local hours, minutes = parseMinutesIntoHoursMinutes(premiumStaminaTimeLeft)

    staminaText = tr('- Stamina Bonus: x%s (%s:%s h remaining)\n', huntingBoostFactor / 100, hours, minutes)
  end

  local storeBoostText = ''
  if storeBoostXpGainTime and storeBoostXpGainTime > 0 then
    local hours = math.floor(storeBoostXpGainTime / 3600)
    local minutes = math.floor((storeBoostXpGainTime % 3600) / 60)

    storeBoostText = tr('- XP Boost: +%s%% (%d:%02d h remaining)\n', storeBoostAddend, hours, minutes)
  end

  local overallXpGain = math.floor((baseXpGain + voucherAddend + grindingAddend + storeBoostAddend) *
    (huntingBoostFactor / 100))

  local text = tr(
    'Your current XP gain rate amounts to %s%%.\nYour XP gain rate is calculated as follows:\n- Base XP Gain: %s%%\n',
    overallXpGain, baseXpGain)
  text = voucherAddend > 0 and text .. tr('- XP voucher: %s%%\n', voucherAddend) or text
  text = grindingAddend > 0 and text .. tr('- Grinding XP Bonus: +%s%%\n', grindingAddend) or text
  text = storeBoostAddend > 0 and text .. storeBoostText or text
  text = huntingBoostFactor > 0 and text .. staminaText or text
  text = text:trim()

  widget:setTooltip(text)
end

function onStoreBoostXpGainTime(player, seconds)
  table.merge(tooltipData, {
    storeBoostXpGainTime = seconds
  })

  updateXpGainTooltip()
end

function onExperienceBonusChange(player, experienceBonus, baseXpGain, voucherAddend, grindingAddend, storeBoostAddend,
                                 huntingBoostFactor)
  table.merge(tooltipData, {
    experienceBonus = experienceBonus,
    baseXpGain = baseXpGain,
    voucherAddend = voucherAddend,
    grindingAddend = grindingAddend,
    storeBoostAddend = storeBoostAddend,
    huntingBoostFactor = huntingBoostFactor
  })

  local overallXpGain = math.floor((baseXpGain + voucherAddend + grindingAddend + storeBoostAddend) *
    (huntingBoostFactor / 100))

  local color
  if overallXpGain > 100 then
    color = '#008b00'
  elseif overallXpGain < 100 then
    color = '#b22222'
  else
    color = '#bbbbbb'
  end

  setSkillValue('xpGain', overallXpGain .. '%')
  setSkillColor('xpGain', color)
  updateXpGainTooltip()
end

function expForLevel(level)
  return math.floor((50 * level * level * level) / 3 - 100 * level * level + (850 * level) / 3 - 200)
end

function expToAdvance(currentLevel, currentExp)
  return expForLevel(currentLevel + 1) - currentExp
end

function resetSkillColor(id)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setColor('#bbbbbb')
end

function toggleSkill(id, state)
  local skill = skillsWindow:recursiveGetChildById(id)
  skill:setVisible(state)
end

function setSkillBase(id, value, baseValue)
  if baseValue <= 0 or value < 0 then
    return
  end
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')

  if value > baseValue then
    widget:setColor('#008b00') -- green
    skill:setTooltip(baseValue .. ' +' .. (value - baseValue))
  elseif value < baseValue then
    widget:setColor('#b22222') -- red
    skill:setTooltip(baseValue .. ' ' .. (value - baseValue))
  else
    widget:setColor('#bbbbbb') -- default
    skill:removeTooltip()
  end
end

function setSkillValue(id, value)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setText(value)
end

function setSkillColor(id, value)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setColor(value)
end

function setSkillTooltip(id, value)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('value')
  widget:setTooltip(value)
end

function setSkillPercent(id, percent, tooltip, color)
  local skill = skillsWindow:recursiveGetChildById(id)
  local widget = skill:getChildById('percent')
  if widget then
    widget:setPercent(math.floor(percent))

    if tooltip then
      widget:setTooltip(tooltip)
    end

    if color then
      widget:setBackgroundColor(color)
    end
  end
end

function checkAlert(id, value, maxValue, threshold, greaterThan)
  if greaterThan == nil then greaterThan = false end
  local alert = false

  -- maxValue can be set to false to check value and threshold
  -- used for regeneration checking
  if type(maxValue) == 'boolean' then
    if maxValue then
      return
    end

    if greaterThan then
      if value > threshold then
        alert = true
      end
    else
      if value < threshold then
        alert = true
      end
    end
  elseif type(maxValue) == 'number' then
    if maxValue < 0 then
      return
    end

    local percent = math.floor((value / maxValue) * 100)
    if greaterThan then
      if percent > threshold then
        alert = true
      end
    else
      if percent < threshold then
        alert = true
      end
    end
  end

  if alert then
    setSkillColor(id, '#b22222') -- red
  else
    resetSkillColor(id)
  end
end

function update()
  local offlineTraining = skillsWindow:recursiveGetChildById('offlineTraining')
  if not g_game.getFeature(GameOfflineTrainingTime) then
    offlineTraining:hide()
  else
    offlineTraining:show()
  end

  local regenerationTime = skillsWindow:recursiveGetChildById('regenerationTime')
  if not g_game.getFeature(GamePlayerRegenerationTime) then
    regenerationTime:hide()
  else
    regenerationTime:show()
  end
end

function refresh()
  local player = g_game.getLocalPlayer()
  if not player then return end

  tooltipData = {}

  if expSpeedEvent then expSpeedEvent:cancel() end
  expSpeedEvent = cycleEvent(checkExpSpeed, 30 * 1000)

  onExperienceChange(player, player:getExperience())
  onLevelChange(player, player:getLevel(), player:getLevelPercent())
  onHealthChange(player, player:getHealth(), player:getMaxHealth())
  onManaChange(player, player:getMana(), player:getMaxMana())
  onSoulChange(player, player:getSoul())
  onFreeCapacityChange(player, player:getFreeCapacity())
  onStaminaChange(player, player:getStamina())
  onMagicLevelChange(player, player:getMagicLevel(), player:getMagicLevelPercent())
  onOfflineTrainingChange(player, player:getOfflineTrainingTime())
  onRegenerationChange(player, player:getRegenerationTime())
  onSpeedChange(player, player:getSpeed())
  onExperienceBonusChange(player, player:getExperienceBonus(), player:getBaseXpGain(), player:getVoucherXpGain(),
    player:getGrindingXpGain(), player:getStoreBoostXpGain(), player:getHuntingBoostFactor())
  onStoreBoostXpGainTime(player, player:getRemainingStoreBoostXpGainTime())

  local hasAdditionalSkills = g_game.getFeature(GameAdditionalSkills)
  for i = Skill.Fist, Skill.ManaLeechAmount do
    onSkillChange(player, i, player:getSkillLevel(i), player:getSkillLevelPercent(i))
    onBaseSkillChange(player, i, player:getSkillBaseLevel(i))

    if i > Skill.Fishing then
      toggleSkill('skillId' .. i, hasAdditionalSkills)
    end
  end

  update()

  local contentsPanel = skillsWindow:getChildById('contentsPanel')
  skillsWindow:setContentMinimumHeight(44)
  if hasAdditionalSkills then
    skillsWindow:setContentMaximumHeight(510)
  else
    skillsWindow:setContentMaximumHeight(420)
  end
end

function offline()
  if expSpeedEvent then
    expSpeedEvent:cancel()
    expSpeedEvent = nil
  end
end

function toggle()
  if skillsButton:isOn() then
    skillsWindow:close()
    skillsButton:setOn(false)
  else
    skillsWindow:open()
    skillsButton:setOn(true)
  end
end

function checkExpSpeed()
  local player = g_game.getLocalPlayer()
  if not player then return end

  local currentExp = player:getExperience()
  local currentTime = g_clock.seconds()
  if player.lastExps ~= nil then
    player.expSpeed = (currentExp - player.lastExps[1][1]) / (currentTime - player.lastExps[1][2])
    onLevelChange(player, player:getLevel(), player:getLevelPercent())
  else
    player.lastExps = {}
  end
  table.insert(player.lastExps, { currentExp, currentTime })
  if #player.lastExps > 30 then
    table.remove(player.lastExps, 1)
  end
end

function onMiniWindowClose()
  skillsButton:setOn(false)
end

function onSkillButtonClick(button)
  local percentBar = button:getChildById('percent')
  if percentBar then
    percentBar:setVisible(not percentBar:isVisible())
    if percentBar:isVisible() then
      button:setHeight(21)
    else
      button:setHeight(21 - 6)
    end
  end
end

function onExperienceChange(localPlayer, value)
  local postFix = ""
  if value > 1e15 then
    postFix = "B"
    value = math.floor(value / 1e9)
  elseif value > 1e12 then
    postFix = "M"
    value = math.floor(value / 1e6)
  elseif value > 1e9 then
    postFix = "K"
    value = math.floor(value / 1e3)
  end
  setSkillValue('experience', comma_value(value) .. postFix)
end

function onLevelChange(localPlayer, value, percent)
  setSkillValue('level', value)
  local text = tr('You have %s percent to go', 100 - percent) .. '\n' ..
      comma_value(expToAdvance(localPlayer:getLevel(), localPlayer:getExperience())) .. tr(' of experience left')

  if localPlayer.expSpeed ~= nil then
    local expPerHour = math.floor(localPlayer.expSpeed * 3600)
    if expPerHour > 0 then
      local nextLevelExp = expForLevel(localPlayer:getLevel() + 1)
      local hoursLeft = (nextLevelExp - localPlayer:getExperience()) / expPerHour
      local minutesLeft = math.floor((hoursLeft - math.floor(hoursLeft)) * 60)
      hoursLeft = math.floor(hoursLeft)
      text = text .. '\n' .. comma_value(expPerHour) .. ' of experience per hour'
      text = text .. '\n' .. tr('Next level in %d hours and %d minutes', hoursLeft, minutesLeft)
    end
  end

  setSkillPercent('level', percent, text)
end

function onHealthChange(localPlayer, health, maxHealth)
  setSkillValue('health', health)
  checkAlert('health', health, maxHealth, 30)
end

function onManaChange(localPlayer, mana, maxMana)
  setSkillValue('mana', mana)
  checkAlert('mana', mana, maxMana, 30)
end

function onSoulChange(localPlayer, soul)
  setSkillValue('soul', soul)
end

function onFreeCapacityChange(localPlayer, freeCapacity)
  setSkillValue('capacity', freeCapacity)
  checkAlert('capacity', freeCapacity, localPlayer:getTotalCapacity(), 20)
end

function onTotalCapacityChange(localPlayer, totalCapacity)
  checkAlert('capacity', localPlayer:getFreeCapacity(), totalCapacity, 20)
end

function onPremiumChange(localPlayer, premium)
  onStaminaChange(localPlayer, localPlayer:getStamina())
end

function onStaminaChange(localPlayer, stamina)
  local hours, minutes = parseMinutesIntoHoursMinutes(stamina)
  if minutes < 10 then
    minutes = '0' .. minutes
  end
  local percent = math.floor(100 * stamina / (42 * 60)) -- max is 42 hours --TODO not in all client versions
  local premiumStaminaTimeLeft = stamina - PREMIUM_STAMINA_THRESHOLD

  table.merge(tooltipData, {
    premiumStaminaTimeLeft = premiumStaminaTimeLeft
  })

  setSkillValue('stamina', hours .. ":" .. minutes)

  --TODO not all client versions have premium time
  if stamina > 2400 and g_game.getClientVersion() >= 1038 and localPlayer:isPremium() then
    local text = tr("You have %s hours and %s minutes left", hours, minutes) .. '\n' ..
        tr("Now you will gain 50%% more experience")
    setSkillPercent('stamina', percent, text, 'green')
  elseif stamina > 2400 and g_game.getClientVersion() >= 1038 and not localPlayer:isPremium() then
    local text = tr("You have %s hours and %s minutes left", hours, minutes) .. '\n' ..
        tr(
          "You will not gain 50%% more experience because you aren't premium player, now you receive only 1x experience points")
    setSkillPercent('stamina', percent, text, '#89F013')
  elseif stamina > 2400 and g_game.getClientVersion() < 1038 then
    local text = tr("You have %s hours and %s minutes left", hours, minutes) .. '\n' ..
        tr("If you are premium player, you will gain 50%% more experience")
    setSkillPercent('stamina', percent, text, 'green')
  elseif stamina <= 2400 and stamina > 840 then
    setSkillPercent('stamina', percent, tr("You have %s hours and %s minutes left", hours, minutes), 'orange')
  elseif stamina <= 840 and stamina > 0 then
    local text = tr("You have %s hours and %s minutes left", hours, minutes) .. "\n" ..
        tr("You gain only 50%% experience and you don't may gain loot from monsters")
    setSkillPercent('stamina', percent, text, 'red')
  elseif stamina == 0 then
    local text = tr("You have %s hours and %s minutes left", hours, minutes) .. "\n" ..
        tr("You don't may receive experience and loot from monsters")
    setSkillPercent('stamina', percent, text, 'black')
  end

  updateXpGainTooltip()
end

function onOfflineTrainingChange(localPlayer, offlineTrainingTime)
  if not g_game.getFeature(GameOfflineTrainingTime) then
    return
  end
  local hours = math.floor(offlineTrainingTime / 60)
  local minutes = offlineTrainingTime % 60
  if minutes < 10 then
    minutes = '0' .. minutes
  end
  local percent = 100 * offlineTrainingTime / (12 * 60) -- max is 12 hours

  setSkillValue('offlineTraining', hours .. ":" .. minutes)
  setSkillPercent('offlineTraining', percent, tr('You have %s percent', percent))
end

function onRegenerationChange(localPlayer, regenerationTime)
  if not g_game.getFeature(GamePlayerRegenerationTime) or regenerationTime < 0 then
    return
  end
  local minutes = math.floor(regenerationTime / 60)
  local seconds = regenerationTime % 60
  if seconds < 10 then
    seconds = '0' .. seconds
  end

  setSkillValue('regenerationTime', minutes .. ":" .. seconds)
  checkAlert('regenerationTime', regenerationTime, false, 300)
end

function onSpeedChange(localPlayer, speed)
  setSkillValue('speed', speed)

  onBaseSpeedChange(localPlayer, localPlayer:getBaseSpeed())
end

function onBaseSpeedChange(localPlayer, baseSpeed)
  setSkillBase('speed', localPlayer:getSpeed(), baseSpeed)
end

function onMagicLevelChange(localPlayer, magiclevel, percent)
  setSkillValue('magiclevel', magiclevel)
  setSkillPercent('magiclevel', percent, tr('You have %s percent to go', 100 - percent))

  onBaseMagicLevelChange(localPlayer, localPlayer:getBaseMagicLevel())
end

function onBaseMagicLevelChange(localPlayer, baseMagicLevel)
  setSkillBase('magiclevel', localPlayer:getMagicLevel(), baseMagicLevel)
end

function onSkillChange(localPlayer, id, level, percent)
  setSkillValue('skillId' .. id, level)
  setSkillPercent('skillId' .. id, percent, tr('You have %s percent to go', 100 - percent))

  onBaseSkillChange(localPlayer, id, localPlayer:getSkillBaseLevel(id))
end

function onBaseSkillChange(localPlayer, id, baseLevel)
  setSkillBase('skillId' .. id, localPlayer:getSkillLevel(id), baseLevel)
end
