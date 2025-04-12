--[[--
@module koplugin.HelloWorld
--]]--

local Dispatcher = require("dispatcher")
local InfoMessage = require("ui/widget/infomessage")
local UIManager = require("ui/uimanager")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local _ = require("gettext")

local Hello = WidgetContainer:extend{
    name = "hello",
    is_doc_only = false,
}

function Hello:onDispatcherRegisterActions()
    Dispatcher:registerAction("helloworld_action", {
        category = "none",
        event = "HelloWorld",
        title = _("Hello World"),
        general = true
    })
end

function Hello:init()
    self:onDispatcherRegisterActions()
    self.ui.menu:registerToMainMenu(self)
end

function Hello:addToMainMenu(menu_items)
    menu_items.hello_world = {
        text = _("Hello World"),
        sorting_hint = "more_tools",
        callback = function()
            local TextViewer = require("ui/widget/textviewer")
            UIManager:show(TextViewer:new{
                title = _("Gemini Summary"),
                text = [[
PUT YOUR TEXT HERE!
                ]]
            })
        end
    }
end

return Hello

