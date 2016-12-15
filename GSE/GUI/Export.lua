local GSE = GSE

local AceGUI = LibStub("AceGUI-3.0")
local L = GSE.L
local libS = LibStub:GetLibrary("AceSerializer-3.0")
local libC = LibStub:GetLibrary("LibCompress")
local libCE = libC:GetAddonEncodeTable()

local exportframe = AceGUI:Create("Frame")
exportframe:Hide()


exportframe:SetTitle(L["Gnome Sequencer: Export a Macro String."])
exportframe:SetStatusText(L["Export a Macro"])
exportframe:SetCallback("OnClose", function(widget)  exportframe:Hide() end)
exportframe:SetLayout("List")

local exportsequencebox = AceGUI:Create("MultiLineEditBox")
exportsequencebox:SetLabel(L["Sequence"])
exportsequencebox:SetNumLines(20)
exportsequencebox:DisableButton(true)
exportsequencebox:SetFullWidth(true)
exportframe:AddChild(exportsequencebox)

GSE.GUIExportframe = exportframe

exportframe.ExportSequenceBox = exportsequencebox

function GSE.GUIExportSequence(classid, sequencename)
  GSE.GUIExportframe.GUIExportSequence:SetText(GSE.ExportSequence(GSELibrary[tonumber(classid)][sequencename], sequencename))
  GSE.GUIExportframe.GUIExportSequence:Show()
end
