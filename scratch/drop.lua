-------------------------------------------------------------------
-- Drop-down applications manager for the awesome window manager
-------------------------------------------------------------------
-- Coded  by: * Lucas de Vries <lucas@glacicle.com>
-- Hacked by: * Adrian C. (anrxc) <anrxc@sysphere.org>
-- Licensed under the WTFPL version 2
--   * http://sam.zoy.org/wtfpl/COPYING
-------------------------------------------------------------------
-- To use this module add:
--   local scratch = require("scratch")
-- to the top of your rc.lua, and call it from a keybinding:
--   scratch.drop(prog, vert, horiz, width, height, sticky, screen)
--
-- Parameters:
--   prog   - Program to run; "urxvt", "gmrun", "thunderbird"
--   vert   - Vertical; "bottom", "center" or "top" (default)
--   horiz  - Horizontal; "left", "right" or "center" (default)
--   width  - Width in absolute pixels, or width percentage
--            when <= 1 (1 (100% of the screen) by default)
--   height - Height in absolute pixels, or height percentage
--            when <= 1 (0.25 (25% of the screen) by default)
--   sticky - Visible on all tags, false by default
--   screen - Screen (optional), mouse.screen by default
-------------------------------------------------------------------

-- Grab environment
local pairs = pairs
local awful = require("awful")
local setmetatable = setmetatable
local capi = {
  mouse = mouse,
  client = client,
  screen = screen
}

-- Scratchdrop: drop-down applications manager for the awesome window manager
local drop = {} -- module scratch.drop


local dropdown = {}


local function xy(vert, horiz, width, height, screen)
  local screengeom = capi.screen[screen].workarea

  if width  <= 1 then width  = screengeom.width  * width  end
  if height <= 1 then height = screengeom.height * height end

  if     horiz == "left"  then x = screengeom.x
  elseif horiz == "right" then x = screengeom.width - width
  else   x =  screengeom.x+(screengeom.width-width)/2 end

  if     vert == "bottom" then y = screengeom.height + screengeom.y - height
  elseif vert == "center" then y = screengeom.y+(screengeom.height-height)/2
  else   y =  screengeom.y - screengeom.y + 22 end
  return x, y, width, height
end

local function placement_client(c)
  
end


-- Create a new window for the drop-down application when it doesn't
-- exist, or toggle between hidden and visible states when it does
function toggle(prog, vert, horiz, width, height, sticky, screen)
  vert      = vert   or "top"
  horiz     = horiz  or "center"
  width     = width  or 1
  height    = height or 0.25
  sticky    = sticky or false
  screen    = screen or capi.mouse.screen
  bdr_width = 1
  x, y, width, height = xy(vert, horiz, width, height, screen)

  -- Determine signal usage in this version of awesome
  local attach_signal = capi.client.connect_signal    or capi.client.add_signal
  local detach_signal = capi.client.disconnect_signal or capi.client.remove_signal

  if not dropdown[prog] then
    -- Add unmanage signal for scratchdrop programs
    attach_signal("unmanage", function (c)
                    if c == dropdown[prog] then
                      dropdown[prog] = nil
                    end
    end)
  end


  if not dropdown[prog] then    --[screen] then
    print("newinstance")
    spawnw = function (c)
      dropdown[prog] = c        --[screen] = c

      c.border_width = bdr_width

      -- Scratchdrop clients are floaters
      awful.client.floating.set(c, true)
	    awful.client.movetoscreen(c,screen)

      -- Client geometry and placement
	    local screengeom = capi.screen[screen].workarea

	    if width  <= 1 then width  = screengeom.width  * width  end
	    if height <= 1 then height = screengeom.height * height end

	    if     horiz == "left"  then x = screengeom.x
	    elseif horiz == "right" then x = screengeom.width - width
	    else   x =  screengeom.x+(screengeom.width-width)/2 end

	    if     vert == "bottom" then y = screengeom.height + screengeom.y - height
	    elseif vert == "center" then y = screengeom.y+(screengeom.height-height)/2
	    else   y =  screengeom.y - screengeom.y + 22 end

      -- Client properties
      c:geometry({ x = x, y = y,
                   width = width - bdr_width * 2,
                   height = height - bdr_width * 2 })
      c.ontop = true
      c.above = true
      c.skip_taskbar = true
      if sticky then c.sticky = true end
      if c.titlebar then awful.titlebar.remove(c) end

      c:raise()
      capi.client.focus = c
      detach_signal("manage", spawnw)
    end

    -- Add manage signal and spawn the program
    attach_signal("manage", spawnw)
    awful.util.spawn(prog, false)
  else
    
    -- Get a running client
    c = dropdown[prog]          --[screen]
    
    -- Switch the client to the current workspace
    if (c:isvisible() == false) or not (c.screen == screen) then c.hidden = true
      awful.client.movetoscreen(c,screen)
      c:geometry({ x = x - 10, y = y,
                   width = width - bdr_width * 2,
                   height = height - bdr_width * 2 })

      awful.client.movetotag(awful.tag.selected(screen), c)
    end

    -- Focus and raise if hidden
    if c.hidden then
      -- Make sure it is centered
      if vert  == "center" then awful.placement.center_vertical(c)   end
      if horiz == "center" then awful.placement.center_horizontal(c) end
      c.hidden = false
      c:raise()
      capi.client.focus = c
    else                        -- Hide and detach tags if not
      c.hidden = true
      local ctags = c:tags()
      for i, t in pairs(ctags) do
        ctags[i] = nil
      end
      c:tags(ctags)
    end
  end
end

return setmetatable(drop, { __call = function(_, ...) return toggle(...) end })
