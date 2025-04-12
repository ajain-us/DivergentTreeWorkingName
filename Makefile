PROGS = _meta.lua llm.lua main.lua

run: $(PROGS)
	mkdir -p ~/.config/koreader/plugins/aisummary.koplugin/; cp $(PROGS) ~/.config/koreader/plugins/aisummary.koplugin/
	koreader

